import 'dart:io';
import 'dart:ui';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:version/version.dart';

import '../../utils/identifiers.dart';

/// This class contains all device specific settings.
class SettingsState {
  static bool get _isFirstRunDefault => true;
  static bool get _hideOtpsDefault => false;
  static bool get _enablePollDefault => false;
  static Set<String> get _crashReportRecipientsDefault => {defaultCrashReportRecipient};
  static Locale get _localePreferenceDefault => S.delegate.supportedLocales
      .firstWhere((locale) => locale.languageCode == (!kIsWeb ? Platform.localeName.substring(0, 2) : 'en'), orElse: () => const Locale('en'));

  static bool get _useSystemLocaleDefault => true;
  static bool get _enableLoggingDefault => false;
  static Version get _latestVersionDefault => Version.parse('0.0.0');

  final bool isFirstRun;
  final bool hideOpts;
  final bool enablePolling;
  final Set<String> crashReportRecipients;
  final Locale localePreference;
  Locale get currentLocale => useSystemLocale
      ? S.delegate.supportedLocales
          .firstWhere((locale) => locale.languageCode == (!kIsWeb ? Platform.localeName.substring(0, 2) : 'en'), orElse: () => const Locale('en'))
      : localePreference;
  final bool useSystemLocale;
  final bool verboseLogging;
  final Version latestStartedVersion;

  SettingsState({
    bool? isFirstRun,
    bool? hideOpts,
    bool? enablePolling,
    Set<String>? crashReportRecipients,
    Locale? localePreference,
    bool? useSystemLocale,
    bool? verboseLogging,
    Version? latestVersion,
  })  : isFirstRun = isFirstRun ?? _isFirstRunDefault,
        hideOpts = hideOpts ?? _hideOtpsDefault,
        enablePolling = enablePolling ?? _enablePollDefault,
        crashReportRecipients = crashReportRecipients ?? _crashReportRecipientsDefault,
        localePreference = localePreference ?? _localePreferenceDefault,
        useSystemLocale = useSystemLocale ?? _useSystemLocaleDefault,
        verboseLogging = verboseLogging ?? _enableLoggingDefault,
        latestStartedVersion = latestVersion ?? _latestVersionDefault;

  SettingsState copyWith({
    bool? isFirstRun,
    bool? hideOpts,
    bool? enablePolling,
    Set<String>? crashReportRecipients,
    Locale? localePreference,
    bool? useSystemLocale,
    bool? verboseLogging,
    Version? latestStartedVersion,
  }) {
    return SettingsState(
      isFirstRun: isFirstRun ?? this.isFirstRun,
      hideOpts: hideOpts ?? this.hideOpts,
      enablePolling: enablePolling ?? this.enablePolling,
      crashReportRecipients: crashReportRecipients ?? this.crashReportRecipients,
      localePreference: localePreference ?? this.localePreference,
      useSystemLocale: useSystemLocale ?? this.useSystemLocale,
      verboseLogging: verboseLogging ?? this.verboseLogging,
      latestVersion: latestStartedVersion ?? this.latestStartedVersion,
    );
  }

  @override
  String toString() => 'SettingsState(isFirstRun: $isFirstRun, hideOpts: $hideOpts, enablePolling: $enablePolling, '
      'crashReportRecipients: $crashReportRecipients, localePreference: $localePreference, useSystemLocale: $useSystemLocale, verboseLogging: $verboseLogging)';

  static String encodeLocale(Locale locale) {
    return '${locale.languageCode}#${locale.countryCode}';
  }

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsState &&
        other.isFirstRun == isFirstRun &&
        other.hideOpts == hideOpts &&
        other.enablePolling == enablePolling &&
        other.crashReportRecipients.toString() == crashReportRecipients.toString() &&
        other.localePreference.toString() == localePreference.toString() &&
        other.useSystemLocale == useSystemLocale &&
        other.verboseLogging == verboseLogging;
  }

  static Locale decodeLocale(String str) {
    var split = str.split('#');
    return split[1] == 'null' ? Locale(split[0]) : Locale(split[0], split[1]);
  }
}
