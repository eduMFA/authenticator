import 'dart:async';
import 'dart:convert';

import 'package:edumfa_authenticator/interfaces/repo/token_repository.dart';
import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/rsa_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:pointycastle/export.dart';

import 'token_notifier_test.mocks.dart';

class MemoryTokenRepository implements TokenRepository {
  final Map<String, String> records = {};
  bool Function(Token) failWrite = (_) => false;
  bool failRead = false;
  bool failDelete = false;
  int writes = 0;
  Completer<void>? writeGate;
  Completer<void>? completionGate;
  Completer<void>? completionReached;

  @override
  Future<List<Token>> loadTokens() async {
    if (failRead) throw PlatformException(code: 'keychain_unavailable', details: -25308);
    return records.values.map((value) => Token.fromJson(jsonDecode(value) as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<Token>> saveOrReplaceTokens(List<Token> tokens) async {
    await writeGate?.future;
    final failed = <Token>[];
    for (final token in tokens) {
      if (token is PushToken && token.isRolledOut && completionGate != null) {
        completionReached?.complete();
        await completionGate!.future;
      }
      writes++;
      if (failWrite(token)) {
        failed.add(token);
      } else {
        records[token.id] = jsonEncode(token);
      }
    }
    return failed;
  }

  @override
  Future<List<Token>> deleteTokens(List<Token> tokens) async {
    if (failDelete) return tokens;
    for (final token in tokens) {
      records.remove(token.id);
    }
    return [];
  }
}

class SmallTestRsaUtils extends RsaUtils {
  @override
  Future<AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>> generateRSAKeyPair() async => AsymmetricKeyPair(
    RSAPublicKey(BigInt.from(3233), BigInt.from(17)),
    RSAPrivateKey(BigInt.from(3233), BigInt.from(2753), BigInt.from(61), BigInt.from(53)),
  );
}

PushToken pendingToken(String id, {bool startEnrollment = false}) => PushToken(
  serial: id,
  label: id,
  issuer: '',
  id: id,
  url: Uri.parse('https://example.com/enroll'),
  expirationDate: DateTime.now().add(const Duration(minutes: 10)),
  rolloutState: startEnrollment ? PushTokenRollOutState.rolloutNotStarted : PushTokenRollOutState.sendRSAPublicKeyFailed,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MemoryTokenRepository repo;
  late TokenNotifier notifier;
  late MockEduMFAIOClient io;
  late MockFirebaseUtils firebase;

  setUp(() async {
    repo = MemoryTokenRepository();
    io = MockEduMFAIOClient();
    firebase = MockFirebaseUtils();
    when(firebase.getFBToken()).thenAnswer((_) async => 'firebase');
    final serverKey = const RsaUtils().serializeRSAPublicKeyPKCS1(RSAPublicKey(BigInt.from(3233), BigInt.from(17)));
    when(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify')))
        .thenAnswer((_) async => Response('{"detail":{"public_key":"$serverKey"}}', 200));
    notifier = TokenNotifier(repository: repo, ioClient: io, firebaseUtils: firebase, rsaUtils: SmallTestRsaUtils());
    await notifier.loadingRepo;
    await Future<void>(() {});
  });

  tearDown(() async {
    await notifier.updatingTokens;
    await notifier.loadingRepo;
    await Future<void>(() {});
    notifier.dispose();
  });

  test('failed additions survive reload and retry without reporting success', () async {
    final token = pendingToken('pending');
    repo.failWrite = (_) => true;
    expect(await notifier.addOrReplaceTokens([token]), isFalse);
    expect(await notifier.saveStateToRepo(), isFalse);
    await notifier.loadStateFromRepo();
    expect(notifier.getTokenFromId(token.id), isNotNull);
    expect(repo.records, isEmpty);

    repo.failWrite = (_) => false;
    await notifier.loadStateFromRepo();
    expect(repo.records.keys, [token.id]);
    expect(notifier.getTokenFromId(token.id), isNotNull);
  });

  test('a temporary read failure retains the last good token list', () async {
    final token = pendingToken('existing');
    await notifier.addOrReplaceTokens([token]);
    repo.failRead = true;
    await notifier.loadStateFromRepo();
    expect(notifier.getTokenFromId(token.id), isNotNull);
    expect(repo.records.keys, [token.id]);
  });

  test('pause and clean saves never rewrite existing tokens', () async {
    await notifier.addOrReplaceTokens([pendingToken('existing')]);
    final writes = repo.writes;
    notifier.onAppPaused();
    expect(await notifier.saveStateToRepo(), isTrue);
    expect(repo.writes, writes);
  });

  test('failed initial persistence prevents enrollment requests', () async {
    final token = pendingToken('pending', startEnrollment: true);
    repo.failWrite = (_) => true;
    expect(await notifier.addOrReplaceTokens([token]), isFalse);
    expect(await notifier.rolloutPushToken(token), isFalse);
    verifyNever(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify')));
  });

  test('the RSA key pair must be saved before contacting the server', () async {
    final token = pendingToken('keys');
    await notifier.addOrReplaceTokens([token]);
    repo.failWrite = (token) => token is PushToken && token.privateTokenKey != null;
    expect(await notifier.rolloutPushToken(token), isFalse);
    verifyNever(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify')));

    repo.failWrite = (_) => false;
    expect(await notifier.rolloutPushToken(token), isTrue);
    final persisted = (await repo.loadTokens()).single as PushToken;
    expect(persisted.privateTokenKey, isNotNull);
    expect(persisted.isRolledOut, isTrue);
    verify(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify'))).called(1);
  });

  test('failed completion is retried locally without re-enrolling or losing the token', () async {
    final token = pendingToken('completion');
    await notifier.addOrReplaceTokens([token]);
    repo.failWrite = (token) => token is PushToken && token.isRolledOut;
    expect(await notifier.rolloutPushToken(token), isFalse);
    expect((notifier.getTokenFromId(token.id)! as PushToken).isRolledOut, isFalse);
    expect(await notifier.saveStateToRepo(), isFalse);
    await notifier.loadStateFromRepo();
    expect(notifier.getTokenFromId(token.id), isNotNull);
    repo.failWrite = (_) => false;
    expect(await notifier.rolloutPushToken(token), isTrue);
    verify(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify'))).called(1);

    await notifier.loadStateFromRepo();
    expect((notifier.getTokenFromId(token.id)! as PushToken).isRolledOut, isTrue);
    expect(((await repo.loadTokens()).single as PushToken).isRolledOut, isTrue);
  });

  test('edits preserve pending completion instead of overwriting it', () async {
    final token = pendingToken('edit');
    await notifier.addOrReplaceTokens([token]);
    repo.failWrite = (token) => token is PushToken && token.isRolledOut;
    expect(await notifier.rolloutPushToken(token), isFalse);
    expect(await notifier.updateToken(token, (token) => token.copyWith(label: 'renamed')), isNull);
    repo.failWrite = (_) => false;
    expect(await notifier.saveStateToRepo(), isTrue);
    final saved = (await repo.loadTokens()).single as PushToken;
    expect(saved.isRolledOut, isTrue);
    expect(saved.label, 'renamed');
  });

  test('completion is not published until its write has finished', () async {
    final token = pendingToken('slow-completion');
    await notifier.addOrReplaceTokens([token]);
    repo.completionGate = Completer<void>();
    repo.completionReached = Completer<void>();
    final rollout = notifier.rolloutPushToken(token);
    await repo.completionReached!.future;
    expect((notifier.getTokenFromId(token.id)! as PushToken).isRolledOut, isFalse);
    repo.completionGate!.complete();
    expect(await rollout, isTrue);
    expect((notifier.getTokenFromId(token.id)! as PushToken).isRolledOut, isTrue);
  });

  test('a fresh notifier recovers persisted enrollment keys even after expiry', () async {
    final token = pendingToken('restart');
    await notifier.addOrReplaceTokens([token]);
    repo.failWrite = (token) => token is PushToken && token.isRolledOut;
    expect(await notifier.rolloutPushToken(token), isFalse);
    final incomplete = jsonDecode(repo.records[token.id]!) as Map<String, dynamic>;
    expect(incomplete['isRolledOut'], isFalse);
    expect(incomplete['publicServerKey'], isNotNull);
    incomplete['expirationDate'] = DateTime.now().subtract(const Duration(minutes: 1)).toIso8601String();
    repo.records[token.id] = jsonEncode(incomplete);
    repo.failWrite = (_) => false;

    final restarted = TokenNotifier(repository: repo, ioClient: io, firebaseUtils: firebase);
    await restarted.loadStateFromRepo();
    expect((restarted.getTokenFromId(token.id)! as PushToken).isRolledOut, isTrue);
    expect(((await repo.loadTokens()).single as PushToken).isRolledOut, isTrue);
    verify(io.doPost(url: anyNamed('url'), body: anyNamed('body'), sslVerify: anyNamed('sslVerify'))).called(1);
    await Future<void>(() {});
    restarted.dispose();
  });

  test('a partially failed batch preserves both saved and pending tokens', () async {
    repo.failWrite = (token) => token.id == 'pending';
    expect(await notifier.addOrReplaceTokens([pendingToken('saved'), pendingToken('pending')]), isFalse);
    expect(repo.records.keys, ['saved']);
    await notifier.loadStateFromRepo();
    expect(notifier.getTokenFromId('saved'), isNotNull);
    expect(notifier.getTokenFromId('pending'), isNotNull);
    repo.failWrite = (_) => false;
    expect(await notifier.saveStateToRepo(), isTrue);
    expect(repo.records.keys.toSet(), {'saved', 'pending'});
  });

  test('expired pending enrollments remain stored after reopening', () async {
    final expired = pendingToken('expired', startEnrollment: true).copyWith(expirationDate: DateTime.now().subtract(const Duration(minutes: 1)));
    await notifier.addOrReplaceTokens([expired]);
    await notifier.loadStateFromRepo();
    expect(notifier.getTokenFromId(expired.id), isNotNull);
    expect(repo.records.keys, [expired.id]);
    expect((notifier.getTokenFromId(expired.id)! as PushToken).rolloutState.rollOutInProgress, isFalse);
  });

  test('concurrent additions and a reload cannot lose a pending save', () async {
    repo.writeGate = Completer<void>();
    final first = notifier.addOrReplaceTokens([pendingToken('first')]);
    final reload = notifier.loadStateFromRepo();
    final second = notifier.addOrReplaceTokens([pendingToken('second')]);
    repo.writeGate!.complete();
    await Future.wait<Object?>([first, reload, second]);
    expect(repo.records.keys.toSet(), {'first', 'second'});
    expect(notifier.getTokenFromId('first'), isNotNull);
    expect(notifier.getTokenFromId('second'), isNotNull);
  });

  test('failed deletion keeps the token, successful deletion cancels pending writes', () async {
    final token = pendingToken('delete');
    await notifier.addOrReplaceTokens([token]);
    repo.failDelete = true;
    await notifier.removeToken(token);
    expect(notifier.getTokenFromId(token.id), isNotNull);
    repo.failWrite = (_) => true;
    await notifier.updateToken(token, (token) => token.copyWith(label: 'pending edit'));
    repo.failDelete = false;
    await notifier.removeToken(token);
    repo.failWrite = (_) => false;
    await notifier.saveStateToRepo();
    expect(notifier.getTokenFromId(token.id), isNull);
    expect(repo.records, isEmpty);
  });

}
