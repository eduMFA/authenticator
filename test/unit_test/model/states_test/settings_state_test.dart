import 'package:flutter_test/flutter_test.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';

void main() {
  _testSettingsState();
}

void _testSettingsState() {
  group('SettingsState', () {
    final state = SettingsState(
      isFirstRun: true,
      hideOpts: true,
      enablePolling: true,
      crashReportRecipients: {'test'},
      verboseLogging: true,
    );
    test('constructor', () {
      expect(state.isFirstRun, true);
      expect(state.enablePolling, true);
      expect(state.crashReportRecipients, {'test'});
      expect(state.verboseLogging, true);
    });
    test('copyWith', () {
      final newState = state.copyWith(
        isFirstRun: false,
        hideOpts: false,
        enablePolling: false,
        crashReportRecipients: {'test2'},
        verboseLogging: false,
      );
      expect(state.isFirstRun, true);
      expect(state.enablePolling, true);
      expect(state.crashReportRecipients, {'test'});
      expect(state.verboseLogging, true);
      expect(newState.isFirstRun, false);
      expect(newState.enablePolling, false);
      expect(newState.crashReportRecipients, {'test2'});
      expect(newState.verboseLogging, false);
    });
  });
}
