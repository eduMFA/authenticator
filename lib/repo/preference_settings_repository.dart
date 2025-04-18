import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';

import 'package:edumfa_authenticator/interfaces/repo/settings_repository.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';

class PreferenceSettingsRepository extends SettingsRepository {
  static const String _isFirstRunKey = 'KEY_IS_FIRST_RUN';
  static const String _prefEnablePoll = 'KEY_ENABLE_POLLING';
  static const String _crashReportRecipientsKey = 'KEY_CRASH_REPORT_RECIPIENTS'; // TODO Use this if the server supports it
  static const String _enableLoggingKey = 'KEY_VERBOSE_LOGGING';
  static const String _latestVersionKey = 'KEY_LATEST_VERSION';

  late final Future<SharedPreferences> _preferences;
  SettingsState? _lastState;

  PreferenceSettingsRepository() {
    _preferences = SharedPreferences.getInstance();
  }

  @override
  Future<SettingsState> loadSettings() async {
    final prefs = await _preferences;
    final newState = SettingsState(
      isFirstRun: prefs.getBool(_isFirstRunKey),
      enablePolling: prefs.getBool(_prefEnablePoll),
      crashReportRecipients: prefs.getStringList(_crashReportRecipientsKey)?.toSet(),
      verboseLogging: prefs.getBool(_enableLoggingKey),
      latestVersion: prefs.getString(_latestVersionKey) != null ? Version.parse(prefs.getString(_latestVersionKey)!) : null,
    );
    _lastState = newState;
    return newState;
  }

  @override
  Future<bool> saveSettings(SettingsState settings) async {
    final prefs = await _preferences;
    final futures = <Future>[
      if (_lastState?.isFirstRun != settings.isFirstRun) prefs.setBool(_isFirstRunKey, settings.isFirstRun),
      if (_lastState?.enablePolling != settings.enablePolling) prefs.setBool(_prefEnablePoll, settings.enablePolling),
      if (_lastState?.crashReportRecipients != settings.crashReportRecipients)
        prefs.setStringList(_crashReportRecipientsKey, settings.crashReportRecipients.toList()),
      if (_lastState?.verboseLogging != settings.verboseLogging) prefs.setBool(_enableLoggingKey, settings.verboseLogging),
      if (_lastState?.latestStartedVersion != settings.latestStartedVersion) prefs.setString(_latestVersionKey, settings.latestStartedVersion.toString()),
    ];
    await Future.wait(futures);
    _lastState = settings;
    return true;
  }
}
