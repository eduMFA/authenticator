import 'package:edumfa_authenticator/model/states/settings_state.dart';

abstract class SettingsRepository {
  Future<bool> saveSettings(SettingsState settings);
  Future<SettingsState> loadSettings();
}
