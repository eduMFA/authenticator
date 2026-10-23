import 'package:edumfa_authenticator/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('flutter.baseflow.com/permissions/methods');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late List<MethodCall> calls;
  late PermissionStatus status;
  late PermissionStatus requestResult;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    calls = [];
    status = PermissionStatus.denied;
    requestResult = PermissionStatus.granted;
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      switch (call.method) {
        case 'checkPermissionStatus':
          expect(call.arguments, Permission.notification.value);
          return status.index;
        case 'requestPermissions':
          expect(call.arguments, [Permission.notification.value]);
          return {Permission.notification.value: requestResult.index};
        default:
          throw StateError('Unexpected permission operation: ${call.method}');
      }
    });
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
    debugDefaultTargetPlatformOverride = null;
  });

  test('does not request notifications that are already granted', () async {
    status = PermissionStatus.granted;

    await checkNotificationPermission();

    expect(calls.map((call) => call.method), ['checkPermissionStatus']);
  });

  test('does not request provisionally authorized iOS notifications', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    status = PermissionStatus.provisional;

    await checkNotificationPermission();

    expect(calls.map((call) => call.method), ['checkPermissionStatus']);
  });

  for (final result in [
    PermissionStatus.granted,
    PermissionStatus.denied,
    PermissionStatus.permanentlyDenied,
  ]) {
    test(
      'requests denied notifications once when the result is $result',
      () async {
        requestResult = result;

        await checkNotificationPermission();

        expect(calls.map((call) => call.method), [
          'checkPermissionStatus',
          'requestPermissions',
        ]);
      },
    );
  }

  test(
    'requests again after permanent denial when settings may have changed',
    () async {
      requestResult = PermissionStatus.permanentlyDenied;
      await checkNotificationPermission();

      // Android status is denied even after a permanent denial. The user may
      // also have reset permissions in Settings since the previous call.
      requestResult = PermissionStatus.granted;
      await checkNotificationPermission();

      expect(calls.map((call) => call.method), [
        'checkPermissionStatus',
        'requestPermissions',
        'checkPermissionStatus',
        'requestPermissions',
      ]);
    },
  );

  test('handles an iOS permanent denial through the request result', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    status = PermissionStatus.permanentlyDenied;
    requestResult = PermissionStatus.permanentlyDenied;

    await checkNotificationPermission();

    expect(calls.map((call) => call.method), [
      'checkPermissionStatus',
      'requestPermissions',
    ]);
  });

  test('does not call the mobile plugin on desktop', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;

    await checkNotificationPermission();

    expect(calls, isEmpty);
  });

  test('handles plugin errors without scheduling repeated requests', () async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      throw PlatformException(code: 'permission_error');
    });

    await checkNotificationPermission();

    expect(calls.map((call) => call.method), ['checkPermissionStatus']);
  });

  test('handles request errors without retrying', () async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      if (call.method == 'checkPermissionStatus') {
        return PermissionStatus.denied.index;
      }
      if (call.method == 'requestPermissions') {
        throw PlatformException(code: 'request_error');
      }
      throw StateError('Unexpected permission operation: ${call.method}');
    });

    await checkNotificationPermission();

    expect(calls.map((call) => call.method), [
      'checkPermissionStatus',
      'requestPermissions',
    ]);
  });
}
