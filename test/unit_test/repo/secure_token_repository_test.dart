import 'dart:convert';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/repo/secure_token_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  const repository = SecureTokenRepository();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late List<MethodCall> calls;
  late Map<String, String> values;
  late String upgradeState;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    calls = [];
    values = {};
    upgradeState = 'ok';
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      final arguments = call.arguments as Map<Object?, Object?>;
      switch (call.method) {
        case 'checkUpgradeStatus':
          return <String, Object>{'state': upgradeState};
        case 'readAll':
          return values;
        case 'read':
          return values[arguments['key']];
        case 'write':
          values[arguments['key']! as String] = arguments['value']! as String;
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

  test(
    'loads existing tokens and preserves the Firebase storage keys',
    () async {
      final token = PushToken(
        serial: 'serial',
        label: 'label',
        issuer: 'issuer',
        id: 'id',
      );
      values = {
        'app_v3_id': jsonEncode(token),
        'app_v3_CURRENT_APP_TOKEN': 'current-firebase-token',
        'app_v3_NEW_APP_TOKEN': 'new-firebase-token',
      };

      final tokens = await repository.loadTokens();

      expect(tokens.single.id, token.id);
      expect(tokens.single.label, token.label);
      expect(calls.map((call) => call.method), [
        'checkUpgradeStatus',
        'readAll',
      ]);
      expect(
        await SecureTokenRepository.getCurrentFirebaseToken(),
        'current-firebase-token',
      );
      expect(
        await SecureTokenRepository.getNewFirebaseToken(),
        'new-firebase-token',
      );
      await SecureTokenRepository.setNewFirebaseToken('refreshed-token');
      expect(values['app_v3_NEW_APP_TOKEN'], 'refreshed-token');

      for (final call in calls) {
        final arguments = call.arguments as Map<Object?, Object?>;
        final options = arguments['options']! as Map<Object?, Object?>;
        expect(options['resetOnError'], 'false');
        expect(options['storageNamespace'], isEmpty);
        expect(options['preferencesKeyPrefix'], isEmpty);
      }
    },
  );

  for (final state in ['legacyDataUnreadable', 'legacyDataDiscarded']) {
    test('handles $state before accessing stored tokens', () async {
      upgradeState = state;
      values['app_v3_id'] = 'legacy ciphertext';

      expect(await repository.loadTokens(), isEmpty);

      expect(calls.map((call) => call.method), ['checkUpgradeStatus']);
      expect(values['app_v3_id'], 'legacy ciphertext');
    });
  }

  test('allows reads when upgrade inspection needs authentication', () async {
    upgradeState = 'unknown';

    expect(await repository.loadTokens(), isEmpty);

    expect(calls.map((call) => call.method), ['checkUpgradeStatus', 'readAll']);
  });
}
