import 'package:version/version.dart';

import 'package:edumfa_authenticator/utils/identifiers.dart';

/// This class contains all device specific settings.
class SettingsState {
  static bool get _isFirstRunDefault => true;
  static bool get _enablePollDefault => false;
  static Set<String> get _crashReportRecipientsDefault => {defaultCrashReportRecipient};

  static bool get _enableLoggingDefault => false;
  static Version get _latestVersionDefault => Version.parse('0.0.0');

  final bool isFirstRun;
  final bool enablePolling;
  final Set<String> crashReportRecipients;
  final bool verboseLogging;
  final Version latestStartedVersion;

  SettingsState({
    bool? isFirstRun,
    bool? hideOpts,
    bool? enablePolling,
    Set<String>? crashReportRecipients,
    bool? verboseLogging,
    Version? latestVersion,
  })  : isFirstRun = isFirstRun ?? _isFirstRunDefault,
        enablePolling = enablePolling ?? _enablePollDefault,
        crashReportRecipients = crashReportRecipients ?? _crashReportRecipientsDefault,
        verboseLogging = verboseLogging ?? _enableLoggingDefault,
        latestStartedVersion = latestVersion ?? _latestVersionDefault;

  SettingsState copyWith({
    bool? isFirstRun,
    bool? hideOpts,
    bool? enablePolling,
    Set<String>? crashReportRecipients,
    bool? verboseLogging,
    Version? latestStartedVersion,
  }) {
    return SettingsState(
      isFirstRun: isFirstRun ?? this.isFirstRun,
      enablePolling: enablePolling ?? this.enablePolling,
      crashReportRecipients: crashReportRecipients ?? this.crashReportRecipients,
      verboseLogging: verboseLogging ?? this.verboseLogging,
      latestVersion: latestStartedVersion ?? this.latestStartedVersion,
    );
  }

  @override
  String toString() => 'SettingsState(isFirstRun: $isFirstRun, enablePolling: $enablePolling, '
      'crashReportRecipients: $crashReportRecipients, verboseLogging: $verboseLogging)';

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsState &&
        other.isFirstRun == isFirstRun &&
        other.enablePolling == enablePolling &&
        other.crashReportRecipients.toString() == crashReportRecipients.toString() &&
        other.verboseLogging == verboseLogging;
  }
}
