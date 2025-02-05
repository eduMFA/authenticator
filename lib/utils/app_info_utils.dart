import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

class AppInfoUtils {
  static bool isInitialized = false;
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static final packageInfo = PackageInfo.fromPlatform();

  static Future<void> init() async {
    _packageInfo = await packageInfo;
    _androidInfo = !kIsWeb && Platform.isAndroid ? await _deviceInfo.androidInfo : null;
    _iosInfo = !kIsWeb && Platform.isIOS ? await _deviceInfo.iosInfo : null;

    isInitialized = true;
  }

  static late final PackageInfo _packageInfo;

  static String get packageName => isInitialized ? _packageInfo.packageName : throw Exception('AppInfoUtils not initialized');
  static Version get appVersion => isInitialized ? Version.parse('${_packageInfo.version}+${_packageInfo.buildNumber}') : throw Exception('AppInfoUtils not initialized');
  static String? get installStore => isInitialized ? _packageInfo.installerStore : throw Exception('AppInfoUtils not initialized');
  static DateTime? get installTime => isInitialized ? _packageInfo.installTime : throw Exception('AppInfoUtils not initialized');
  static String get locale => Platform.localeName;

  static String get systemInfoString {
    String data = 'App Version: $appVersion\n'
        'Locale: $locale\n'
        'Installation: ${installStore ?? 'Unknown Store'} at ${installTime?.toString() ?? 'Unknown Time'}\n';

    if (kIsWeb) {
      data += 'Platform: Web';
    } else if (Platform.isAndroid) {
      data += _androidDeviceInfoString!;
    } else if (Platform.isIOS) {
      data += _iosDeviceInfoString!;
    } else {
      data += 'Platform: Unknown';
    }
    return data;
  }

  static AndroidDeviceInfo? get androidInfo => isInitialized ? _androidInfo : throw Exception('AppInfoUtils not initialized');
  static late final AndroidDeviceInfo? _androidInfo;

  static String? get androidDeviceInfoString => _androidDeviceInfoString;
  static final String? _androidDeviceInfoString = androidInfo != null
      ? 'Operating System: Android ${_androidInfo!.version.release} (API Level: ${androidInfo!.version.sdkInt})\n'
        'Model: ${androidInfo!.manufacturer} ${androidInfo!.model}'
      : null;

  static IosDeviceInfo? get iosInfo => isInitialized ? _iosInfo : throw Exception('AppInfoUtils not initialized');
  static late final IosDeviceInfo? _iosInfo;

  String? get iosDeviceInfoString => _iosDeviceInfoString;
  static final String? _iosDeviceInfoString = iosInfo != null
      ? 'Operating System: ${iosInfo!.systemName} ${iosInfo!.systemVersion}\n'
        'Model: ${iosInfo!.modelName}\n'
        'Hardware type: ${iosInfo!.utsname.machine}'
      : null;
}
