import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on ThemeMode {

  String getName(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return S.of(context).autoTheme;
      case ThemeMode.light:
        return S.of(context).lightTheme;
      case ThemeMode.dark:
        return S.of(context).darkTheme;
    }
  }
}