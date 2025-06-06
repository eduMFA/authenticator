import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pointycastle/export.dart';
import 'package:edumfa_authenticator/interfaces/repo/token_repository.dart';
import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/push_request.dart';
import 'package:edumfa_authenticator/model/push_request_queue.dart';
import 'package:edumfa_authenticator/model/states/token_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/firebase_utils.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/network_utils.dart';
import 'package:edumfa_authenticator/utils/rsa_utils.dart';

import 'token_notifier_test.mocks.dart';

@GenerateMocks(
  [
    TokenRepository,
    RsaUtils,
    EduMFAIOClient,
    FirebaseUtils,
  ],
)
void main() {
  _testTokenNotifier();
}

void _testTokenNotifier() {
  group('TokenNotifier', () {
    test('refreshRolledOutPushTokens', () async {
      final container = ProviderContainer();
      final mockRepo = MockTokenRepository();
      final before = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, pushRequests: PushRequestQueue()),
      ];
      final queue = PushRequestQueue()
        ..add(PushRequest(
            title: 'title',
            uri: Uri.parse('https://example.com'),
            nonce: 'nonce',
            sslVerify: false,
            id: 1,
            expirationDate: DateTime.now().add(const Duration(minutes: 3))));
      final after = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, pushRequests: queue),
      ];
      final responses = [before, after];
      when(mockRepo.loadTokens()).thenAnswer((_) async => responses.removeAt(0));
      final testProvider = StateNotifierProvider<TokenNotifier, TokenState>(
        (ref) => TokenNotifier(repository: mockRepo),
      );
      final notifier = container.read(testProvider.notifier);
      expect((await notifier.loadStateFromRepo())?.tokens, after);
      final state = container.read(testProvider);
      expect(state, isNotNull);
      expect(state.tokens, after);
      verify(mockRepo.loadTokens()).called(2);
    });
    test('addTokenFromOtpAuth: rolloutPushToken', () async {
      final container = ProviderContainer();
      final mockRepo = MockTokenRepository();
      final mockRsaUtils = MockRsaUtils();
      final mockIOClient = MockEduMFAIOClient();
      final mockFirebaseUtils = MockFirebaseUtils();
      const rsaUtils = RsaUtils();
      const publicServerKeyString =
          'MIICCgKCAgEAomCYODF47vz/axztjlmEcepqZPC8NNhXTlPu/FPGJ+qIOq+swTiEYgmv8DYIAslqLy3EHa7JUouSlE3f1l4OUcqZvPGgEP5Cpbjnaddy6u4Pt37YLDtlhX7nnd+VZnDLxXxqQ62e1CEOJVjKWq1x2Bq2GPcQz0fwWfGjNH7PtN+F00i3NiN0FPigOD4p7Bcru1ihWToQMobzf/p1945Yu0fwfpwUhHn0cfG5uKUrXl4T24s0b92MA8CmxYKKlenEQu9EezljeH2PJ0h1kfv58xjAEVEdwjCb8jzHwXomzJWUqZHt0BexavR+sUQNyk8r5OdX0fgOo+4W3/H+b/0Ktn47Frn827pYB8c2AX8lqxFocP6lj62hjCfKWss0rgqQBegTd9trCuN2iiw/Dj1HLFzK2Z8JwGDrQni1F8nyevaaZOuZI3I4DAFJzYKcP/zDvkNs6qpa+P1kzg50ml3m0RONGIHrzcSeo3aVeaMMdHXKhB5dqrig6Sjblqt2hwdPAWQPOiq9pTAXZIJmXI0UJb3bfWKlPIUmiZPRs+xYom+aZ9VEBTLdcxGC6puAJyUsjoXBJTJqH7O8g/pWA02UfPALEcuDAVQOSJbahodkWmrBg8jIMnjNOkN1t9hxHbg5XSWidgei4D/MJp4xH9w0eHyVZSnVTY5Iah0GkCVQFVsCAwEAAQ==';
      const publicTokenKeyString =
          'MIICCgKCAgEAuVWX4JptR4W2NHIMA4feqd/qUXKHAEfVUAKCYWdYEpq8x3tKWsFu9sVERA4rsTG+7Q6fEG1FdOSpJWVXW+paJpt7QDgp0/9VDr0Vn3bd6k7oYL2lDMm5NKEJA/Zk577OOXGogspksUkw3WtEg8meYB6mO8Tk+pPLmJnnLU2C+F8oeftRHQTXJhGMuWRLVhuA/hgMHUW7a7ICARiJhMz0hMWtQAzK0AHVxPDlybggYIYCSa2G5t53m62IDdOkb4LINpZVMCS2/tCDUJzVlzEmJF3G3cxxFaG3R4DkvkoUgLLpwdIj2Kw1FOJVkLyz1BJVfbmt6TvpsXc1G71yXk1p3MCFfilfiPY5U4LQfrR1A+F+rHFZtpQb2Hha1KMGGjBorHu5rpeFqLV1U2pL7CE/qjb/xUkVk1DbXH+26P3gLmrg2pm5TbMogskTUI29WDsklFj1LkH/sXRnWcIbYNp0QdN//FivlYFM4OxAoY1S1ofIu3Xj/rdVRtUvSE8kR7r1v6Xf6oHMkQIbS3mrQgJZNc0eV80TuCnT/YmvsTzT9jXGPQYUeZ4MvENnun7GB2TVdVgJ6srcknZgQGB2zWOUpf1I2xA9wzLTYhVpZKrU10eOxXr/Fao0tf2oNB+QldPRoUFL77z6VYHNIPFr9Yi/WFBVDl7gQ05hu+pVBNmhRN8CAwEAAQ==';
      const privateTokenKeyString =
          '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';
      final publicServerKey = rsaUtils.deserializeRSAPublicKeyPKCS1(publicServerKeyString);
      final publicTokenKey = rsaUtils.deserializeRSAPublicKeyPKCS1(publicTokenKeyString);
      final privateTokenKey = rsaUtils.deserializeRSAPrivateKeyPKCS1(privateTokenKeyString);

      final pushTokenShouldBe = PushToken(
        label: 'PIPU0006BF18',
        issuer: 'eduMFA',
        id: '20663f77-a26e-41c3-8946-d0efb8b386d3',
        pin: false,
        tokenImage: null,
        type: 'EDUMFA_PUSH',
        serial: 'PIPU0006BF18',
        sslVerify: false,
        enrollmentCredentials: 'ae60d4744ac5384515574b85f538c6a4e0c7bc82',
        url: Uri.parse('https://192.168.178.30/ttype/push'),
        isRolledOut: true,
        rolloutState: PushTokenRollOutState.rolloutComplete,
        publicServerKey: publicServerKeyString,
        publicTokenKey: publicTokenKeyString,
        privateTokenKey: privateTokenKeyString,
        pushRequests: PushRequestQueue(),
      );
      final after = <Token>[
        pushTokenShouldBe,
      ];

      when(mockFirebaseUtils.getFBToken()).thenAnswer((_) async => 'fbToken');
      when(mockRepo.loadTokens()).thenAnswer((_) async => []);
      when(mockRsaUtils.generateRSAKeyPair()).thenAnswer((realInvocation) async => AsymmetricKeyPair(publicTokenKey, privateTokenKey));
      when(mockRsaUtils.serializeRSAPublicKeyPKCS8(publicServerKey)).thenReturn(publicServerKeyString);
      when(mockRsaUtils.serializeRSAPublicKeyPKCS8(publicTokenKey)).thenReturn(publicTokenKeyString);
      when(mockRsaUtils.deserializeRSAPublicKeyPKCS1(publicServerKeyString)).thenReturn(publicServerKey);
      when(mockRsaUtils.deserializeRSAPublicKeyPKCS1(publicTokenKeyString)).thenReturn(publicTokenKey);
      when(mockRsaUtils.deserializeRSAPrivateKeyPKCS1(privateTokenKeyString)).thenReturn(privateTokenKey);
      when(mockRepo.saveOrReplaceTokens([after.last])).thenAnswer((_) async => []);
      when(mockRepo.saveOrReplaceTokens([])).thenAnswer((_) async => []);
      when(mockIOClient.doPost(
        url: anyNamed('url'),
        body: anyNamed('body'),
        sslVerify: anyNamed('sslVerify'),
      )).thenAnswer(
        (_) => Future.value(
          Response(
            '{"detail": {"public_key": "$publicServerKeyString", "rollout_state": "enrolled", "serial": "PIPU0006BF18", "threadid": 140024860083968}, "id": 1, "jsonrpc": "2.0", "result": {"status": true, "value": true}, "time": 1701091444.6211884, "version": "eduMFA 3.9.dev3", "versionnumber": "3.9.dev3", "signature": "rsa_sha256_pss:c137b543b0df817ebd89ff53c5924c94f916c2bfebbe03ceb14e806ffdb46deb00fd336c83f3e0fb06ffbdf4926e83b5440f7f117498341608d644e4c1f2bbf9319eb59b98d5485c42b40325c9f29427cc8ae67728e486db247be0510a92f74936ea57436ecbe5304bcc50fcb624c3bde8e3039419592e9fbe8c0cb85431c2931ea8d6a6369fccf7e4c15c9cfaea896d8ec7896811545083bd6d3f5416e7d54b43f1f4752bf2a57c2b12a139fe217d1eec1292b071b9c6cef31e5f6eb957c7ad2a1d3bd105a74c80f961f5e307393824b8767807116a8573448f45f6cc112317105fb4e9e294f1a99faaf78b2f902ea1553cf5e428bfa98041c74cc23302df6f"}',
            200,
          ),
        ),
      );

      final notifier = TokenNotifier(repository: mockRepo, rsaUtils: mockRsaUtils, ioClient: mockIOClient, firebaseUtils: mockFirebaseUtils);
      final testProvider = StateNotifierProvider<TokenNotifier, TokenState>((ref) => notifier);
      await notifier.handleQrCodeUri(
          Uri(
              scheme: 'edumfa-push',
              host: 'edumfa-push',
              path: 'PIPU0006BF18',
              queryParameters: {
                'url': 'https://192.168.178.30/ttype/push',
                'ttl': "10",
                'issuer': 'eduMFA',
                'enrollment_credential': 'ae60d4744ac5384515574b85f538c6a4e0c7bc82',
                'v': "1",
                'serial': 'PIPU0006BF18',
                'sslverify': ""
              }
          ).toString()
      );
      final tokenState = container.read(testProvider);
      expect(tokenState, isNotNull);
      expect(tokenState.tokens, after);
      verify(mockRsaUtils.generateRSAKeyPair()).called(1);
      verify(mockIOClient.doPost(
        url: anyNamed('url'),
        body: anyNamed('body'),
        sslVerify: anyNamed('sslVerify'),
      )).called(1);
      final pushToken = tokenState.pushTokens.first;
      expect(pushToken.enrollmentCredentials, pushTokenShouldBe.enrollmentCredentials);
      expect(pushToken.publicServerKey, pushTokenShouldBe.publicServerKey);
      expect(pushToken.publicTokenKey, pushTokenShouldBe.publicTokenKey);
      expect(pushToken.privateTokenKey, pushTokenShouldBe.privateTokenKey);
      expect(pushToken.rolloutState, pushTokenShouldBe.rolloutState);
      expect(pushToken.serial, pushTokenShouldBe.serial);
      expect(pushToken.isRolledOut, pushTokenShouldBe.isRolledOut);
      expect(pushToken.pushRequests, pushTokenShouldBe.pushRequests);
      expect(pushToken.url, pushTokenShouldBe.url);
      expect(pushToken.label, pushTokenShouldBe.label);
      expect(pushToken.issuer, pushTokenShouldBe.issuer);
      expect(pushToken.type, pushTokenShouldBe.type);
      expect(pushToken.pin, pushTokenShouldBe.pin);
      expect(pushToken.tokenImage, pushTokenShouldBe.tokenImage);
      expect(pushToken.sslVerify, pushTokenShouldBe.sslVerify);
    });
    test('addPushRequestToToken', () async {
      final container = ProviderContainer();
      final mockRepo = MockTokenRepository();
      final mockRsaUtils = MockRsaUtils();
      final before = <PushToken>[
        PushToken(
          label: 'label',
          issuer: 'issuer',
          id: 'id',
          serial: 'serial',
          isRolledOut: true,
          pushRequests: PushRequestQueue(),
          url: Uri.parse('https://example.com'),
          privateTokenKey: 'privateTokenKey',
        ).withPublicServerKey(RSAPublicKey(BigInt.one, BigInt.one)),
      ];
      final pr = PushRequest(
        title: 'title',
        uri: Uri.parse('https://example.com'),
        nonce: 'nonce',
        serial: 'serial',
        sslVerify: false,
        id: 1,
        expirationDate: DateTime.now().add(const Duration(minutes: 3)),
      );
      final after = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, pushRequests: PushRequestQueue()..add(pr)),
      ];
      when(mockRepo.loadTokens()).thenAnswer((_) async => before);
      when(mockRepo.saveOrReplaceTokens([after.first])).thenAnswer((_) async => []);
      when(mockRsaUtils.verifyRSASignature(any, any, any)).thenReturn(true);
      final testProvider = StateNotifierProvider<TokenNotifier, TokenState>(
        (ref) => TokenNotifier(repository: mockRepo, rsaUtils: mockRsaUtils),
      );
      final notifier = container.read(testProvider.notifier);
      expect(await notifier.addPushRequestToToken(pr), true);
      final state = container.read(testProvider);
      expect(state, isNotNull);
      expect(state.tokens, after);
      verify(mockRepo.saveOrReplaceTokens([after.first])).called(1);
      verify(mockRsaUtils.verifyRSASignature(any, any, any)).called(1);
    });
    test('removePushRequest', () async {
      final container = ProviderContainer();
      final mockRepo = MockTokenRepository();
      final pr = PushRequest(
          title: 'title',
          uri: Uri.parse('https://example.com'),
          nonce: 'nonce',
          serial: 'serial',
          sslVerify: false,
          id: 1,
          expirationDate: DateTime.now().add(const Duration(minutes: 3)));
      final before = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, pushRequests: PushRequestQueue()..add(pr)),
      ];
      final after = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, pushRequests: PushRequestQueue()),
      ];
      when(mockRepo.loadTokens()).thenAnswer((_) async => before);
      when(mockRepo.saveOrReplaceTokens([after.first])).thenAnswer((_) async => []);
      final testProvider = StateNotifierProvider<TokenNotifier, TokenState>(
        (ref) => TokenNotifier(repository: mockRepo),
      );
      final notifier = container.read(testProvider.notifier);
      await notifier.removePushRequest(pr);
      final state = container.read(testProvider);
      expect(state, isNotNull);
      expect(state.tokens, after);
      verify(mockRepo.saveOrReplaceTokens([after.first])).called(1);
    });

    test('rolloutPushToken', () async {
      final container = ProviderContainer();
      final mockRepo = MockTokenRepository();
      final mockIOClient = MockEduMFAIOClient();
      final mockFirebaseUtils = MockFirebaseUtils();
      final mockRsaUtils = MockRsaUtils();
      final uri = Uri.parse('https://example.com');
      final before = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: false, url: uri),
      ];
      final after = <PushToken>[
        PushToken(label: 'label', issuer: 'issuer', id: 'id', serial: 'serial', isRolledOut: true, url: uri),
      ];
      when(mockRepo.loadTokens()).thenAnswer((_) async => before);
      when(mockRepo.saveOrReplaceTokens([after.first])).thenAnswer((_) async => []);
      when(mockRsaUtils.serializeRSAPublicKeyPKCS8(any)).thenAnswer((_) => 'publicKey');
      when(mockRsaUtils.generateRSAKeyPair()).thenAnswer((_) => const RsaUtils()
          .generateRSAKeyPair()); // We get here a random result anyway and is it more likely to make errors by mocking it than by using the real method
      when(mockFirebaseUtils.getFBToken()).thenAnswer((_) => Future.value('fbToken'));
      when(mockRsaUtils.deserializeRSAPublicKeyPKCS1('publicKey')).thenAnswer((_) => RSAPublicKey(BigInt.one, BigInt.one));
      when(mockIOClient.doPost(
        url: anyNamed('url'),
        body: anyNamed('body'),
        sslVerify: anyNamed('sslVerify'),
      )).thenAnswer((_) => Future.value(Response('{"detail": {"public_key": "publicKey"}}', 200)));
      final testProvider = StateNotifierProvider<TokenNotifier, TokenState>(
        (ref) => TokenNotifier(
          repository: mockRepo,
          rsaUtils: mockRsaUtils,
          ioClient: mockIOClient,
          firebaseUtils: mockFirebaseUtils,
        ),
      );

      final notifier = container.read(testProvider.notifier);
      Logger.info('before rolloutPushToken');
      expect(await notifier.rolloutPushToken(before.first), true);
      Logger.info('after rolloutPushToken');
      final state = container.read(testProvider);
      expect(state, isNotNull);
      expect(state.tokens, after);
      verify(mockRepo.saveOrReplaceTokens([after.first])).called(greaterThan(0));
      verify(mockRsaUtils.serializeRSAPublicKeyPKCS8(any)).called(greaterThan(0));
      verify(mockFirebaseUtils.getFBToken()).called(greaterThan(0));
      verify(mockRsaUtils.deserializeRSAPublicKeyPKCS1('publicKey')).called(greaterThan(0));
      verify(mockIOClient.doPost(
        url: anyNamed('url'),
        body: anyNamed('body'),
        sslVerify: anyNamed('sslVerify'),
      )).called(greaterThan(0));
    });
  });
}
