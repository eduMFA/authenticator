import 'dart:convert';
import 'dart:async';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/repo/secure_token_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  const repository = SecureTokenRepository();
  final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late List<MethodCall> calls;
  late Map<String, String> values;
  late String upgradeState;
  String? failingOperation;
  Completer<void>? deletion;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    calls = [];
    values = {};
    upgradeState = 'ok';
    failingOperation = null;
    deletion = null;
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      final arguments = call.arguments as Map<Object?, Object?>;
      if (call.method == failingOperation) {
        throw PlatformException(code: 'keychain_unavailable', details: -25308);
      }
      switch (call.method) {
        case 'checkUpgradeStatus':
          return <String, Object>{'state': upgradeState};
        case 'readAll':
          return Map<String, String>.of(values);
        case 'read':
          return values[arguments['key']];
        case 'write':
          values[arguments['key']! as String] = arguments['value']! as String;
          return null;
        case 'delete':
          await deletion?.future;
          values.remove(arguments['key']);
          return null;
        default:
          throw StateError('Unexpected storage operation: ${call.method}');
      }
    });
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
    debugDefaultTargetPlatformOverride = null;
  });

  test('loads existing tokens and preserves the Firebase storage keys', () async {
    final token = PushToken(serial: 'serial', label: 'label', issuer: 'issuer', id: 'id');
    values = {'app_v3_id': jsonEncode(token), 'app_v3_CURRENT_APP_TOKEN': 'current-firebase-token', 'app_v3_NEW_APP_TOKEN': 'new-firebase-token'};

    final tokens = await repository.loadTokens();

    expect(tokens.single.id, token.id);
    expect(tokens.single.label, token.label);
    expect(calls.map((call) => call.method), ['checkUpgradeStatus', 'readAll']);
    expect(await SecureTokenRepository.getCurrentFirebaseToken(), 'current-firebase-token');
    expect(await SecureTokenRepository.getNewFirebaseToken(), 'new-firebase-token');
    await SecureTokenRepository.setNewFirebaseToken('refreshed-token');
    expect(values['app_v3_NEW_APP_TOKEN'], 'refreshed-token');

    for (final call in calls) {
      final arguments = call.arguments as Map<Object?, Object?>;
      final options = arguments['options']! as Map<Object?, Object?>;
      expect(options['resetOnError'], 'false');
      expect(options['storageNamespace'], isEmpty);
      expect(options['preferencesKeyPrefix'], isEmpty);
    }
  });

  for (final state in ['legacyDataUnreadable', 'legacyDataDiscarded']) {
    test('handles $state before accessing stored tokens', () async {
      upgradeState = state;
      values['app_v3_id'] = 'legacy ciphertext';

      await expectLater(repository.loadTokens(), throwsA(isA<PlatformException>()));

      expect(calls.map((call) => call.method), ['checkUpgradeStatus']);
      expect(values['app_v3_id'], 'legacy ciphertext');
    });
  }

  test('allows reads when upgrade inspection needs authentication', () async {
    upgradeState = 'unknown';

    expect(await repository.loadTokens(), isEmpty);

    expect(calls.map((call) => call.method), ['checkUpgradeStatus', 'readAll']);
  });

  test('preserves unreadable records and loads every healthy token', () async {
    final healthy = PushToken(serial: 'healthy', label: 'healthy', issuer: '', id: 'healthy');
    values = {
      'app_v3_healthy': jsonEncode(healthy),
      'app_v3_invalid_json': '{broken',
      'app_v3_wrong_shape': '[]',
      'app_v3_missing_field': '{"type":"EDUMFA_PUSH"}',
      'app_v3_unknown_type': '{"type":"future-token"}',
      'app_v3_unknown_enum': jsonEncode({...healthy.toJson(), 'rolloutState': 'future-state'}),
      'unrelated': '{broken',
      'app_v3_CURRENT_APP_TOKEN': 'firebase',
    };
    final original = Map<String, String>.of(values);

    expect((await repository.loadTokens()).map((token) => token.id), ['healthy']);
    expect(values, original);
    expect(calls.any((call) => call.method == 'delete'), isFalse);
  });

  test('propagates temporary access errors instead of returning an empty list', () async {
    values['app_v3_existing'] = 'preserved';
    failingOperation = 'readAll';
    await expectLater(repository.loadTokens(), throwsA(isA<PlatformException>()));
    expect(values['app_v3_existing'], 'preserved');
  });

  test('reports failed writes', () async {
    final token = PushToken(serial: 'serial', label: '', issuer: '', id: 'id');
    failingOperation = 'write';
    expect(await repository.saveOrReplaceTokens([token]), [token]);
  });

  test('awaits deletion and reports asynchronous failures', () async {
    final token = PushToken(serial: 'serial', label: '', issuer: '', id: 'id');
    values['app_v3_id'] = jsonEncode(token);
    deletion = Completer<void>();
    var completed = false;
    final result = repository.deleteTokens([token]).then((failed) {
      completed = true;
      return failed;
    });
    await Future<void>(() {});
    expect(completed, isFalse);
    expect(values, isNotEmpty);
    deletion!.complete();
    expect(await result, isEmpty);
    expect(values, isEmpty);

    failingOperation = 'delete';
    expect(await repository.deleteTokens([token]), [token]);
  });

  test('iOS writes use the non-destructive native channel and existing keys', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    const ios = MethodChannel('io.edumfa.authenticator/token_storage');
    final safeCalls = <MethodCall>[];
    messenger.setMockMethodCallHandler(ios, (call) async {
      safeCalls.add(call);
      return null;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(ios, null));
    final token = PushToken(serial: 'serial', label: '', issuer: '', id: 'id');
    expect(await repository.saveOrReplaceTokens([token]), isEmpty);
    final arguments = safeCalls.single.arguments as Map<Object?, Object?>;
    expect(safeCalls.single.method, 'write');
    expect(arguments['key'], 'app_v3_id');
    expect(jsonDecode(arguments['value']! as String)['id'], 'id');
    expect(calls, isEmpty);

    messenger.setMockMethodCallHandler(ios, (call) async {
      throw PlatformException(code: 'keychain_write_failed', details: -25308);
    });
    expect(await repository.saveOrReplaceTokens([token]), [token]);
    expect(calls, isEmpty); // Never fall back to the plugin's destructive writer.
  });
}
