import 'package:edumfa_authenticator/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on ThemeMode {

  String getName(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return AppLocalizations.of(context)!.autoTheme;
      case ThemeMode.light:
        return AppLocalizations.of(context)!.lightTheme;
      case ThemeMode.dark:
        return AppLocalizations.of(context)!.darkTheme;
    }
  }
}