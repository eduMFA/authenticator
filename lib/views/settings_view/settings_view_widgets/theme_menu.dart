import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/l10n/app_localizations.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:flutter/material.dart';

class ThemeMenu extends StatelessWidget {
  const ThemeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultDialog(
        scrollable: true,
        title: Text(AppLocalizations.of(context)!.theme),
        content: Column(
          children: [
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.autoTheme,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              value: ThemeMode.system,
              groupValue: EasyDynamicTheme.of(context).themeMode,
              controlAffinity: ListTileControlAffinity.trailing,
              toggleable: true,
              onChanged: (dynamic themeMode) => _changeTheme(context, themeMode),
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.lightTheme,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
              value: ThemeMode.light,
              groupValue: EasyDynamicTheme.of(context).themeMode,
              controlAffinity: ListTileControlAffinity.trailing,
              toggleable: true,
              onChanged: (dynamic themeMode) => _changeTheme(context, themeMode),
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.darkTheme,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
              value: ThemeMode.dark,
              groupValue: EasyDynamicTheme.of(context).themeMode,
              controlAffinity: ListTileControlAffinity.trailing,
              toggleable: true,
              onChanged: (dynamic themeMode) => _changeTheme(context, themeMode),
            ),
          ],
        ),
      ),
    );
  }

  void _changeTheme(BuildContext context, ThemeMode? themeMode) {
    // We've enabled toggleable, to always get feedback when anything is clicked.
    // This allows better UX, so the user can select the option they already chose.
    // In such case, we just ignore the input and close the dialog.
    if (themeMode != null) {
      EasyDynamicTheme.of(context).changeTheme(
        dynamic: themeMode == ThemeMode.system,
        dark: themeMode == ThemeMode.dark,
      );
    }
    Navigator.pop(context);
  }

}