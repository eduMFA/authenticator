import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';

import 'package:edumfa_authenticator/interfaces/repo/settings_repository.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/push_provider.dart';

/// This class provies access to the device specific settings.
/// It also ensures that the settings are saved to the device.
/// To Update a state use: ref.read(settingsProvider.notifier).anyMethod(value)
class SettingsNotifier extends StateNotifier<SettingsState> {
  late Future<SettingsState> loadingRepo;
  final SettingsRepository _repo;

  SettingsNotifier({
    required SettingsRepository repository,
    SettingsState? initialState,
  })  : _repo = repository,
        super(initialState ?? SettingsState()) {
    loadFromRepo();
  }
  void loadFromRepo() async {
    loadingRepo = Future(() async {
      final newState = await _repo.loadSettings();
      PushProvider(pollingEnabled: state.enablePolling);
      state = newState;
      PushProvider(pollingEnabled: state.enablePolling);
      Logger.info('Loading settings from repo: $newState', name: 'settings_notifier.dart#_loadFromRepo');
      return newState;
    });
  }

  void _saveToRepo() async {
    loadingRepo = Future(() async {
      await _repo.saveSettings(state);
      Logger.info('Saving settings to repo: $state', name: 'settings_notifier.dart#_saveToRepo');
      return state;
    });
  }

  void addCrashReportRecipient(String email) {
    Logger.info('Crash report recipient added: $email', name: 'settings_notifier.dart#addCrashReportRecipient');
    var updatedSet = state.crashReportRecipients..add(email);
    state = state.copyWith(crashReportRecipients: updatedSet);
    _saveToRepo();
  }

  set isFirstRun(bool value) {
    Logger.info('First run set to $value', name: 'settings_notifier.dart#setFirstRun');
    state = state.copyWith(isFirstRun: value);
    _saveToRepo();
  }

  void enablePolling() {
    Logger.info('Polling set to true', name: 'settings_notifier.dart#enablePolling');
    state = state.copyWith(enablePolling: true);
    _saveToRepo();
  }

  void disablePolling() {
    Logger.info('Polling set to false', name: 'settings_notifier.dart#disablePolling');
    state = state.copyWith(enablePolling: false);
    _saveToRepo();
  }

  void setPolling(bool value) {
    Logger.info('Polling set to $value', name: 'settings_notifier.dart#setPolling');
    state = state.copyWith(enablePolling: value);
    _saveToRepo();
  }

  void setVerboseLogging(bool value) {
    Logger.info('Verbose logging set to $value', name: 'settings_notifier.dart#setVerboseLogging');
    state = state.copyWith(verboseLogging: value);
    _saveToRepo();
  }

  void toggleVerboseLogging() {
    final value = !state.verboseLogging;
    Logger.info('Verbose logging set to $value', name: 'settings_notifier.dart#setVerboseLogging');
    state = state.copyWith(verboseLogging: value);
    _saveToRepo();
  }

  void setFirstRun(bool value) {
    Logger.info('First run set to $value', name: 'settings_notifier.dart#setFirstRun');
    state = state.copyWith(isFirstRun: value);
    _saveToRepo();
  }

  void setLatestStartedVersion(Version version) {
    Logger.info('Latest started version set to $version', name: 'settings_notifier.dart#setLatestStartedVersion');
    state = state.copyWith(latestStartedVersion: version);
    _saveToRepo();
  }
}
