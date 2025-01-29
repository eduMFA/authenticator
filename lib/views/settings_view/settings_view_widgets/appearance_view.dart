import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/extensions/theme_extension.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_tile.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/theme_menu.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';

class AppearanceSettingsView extends StatelessView {
  static const String routeName = '/appearance';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const AppearanceSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appearance),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsTile(
              icon: Icons.brightness_4,
              title: S.of(context).theme,
              subtitle: (EasyDynamicTheme.of(context).themeMode ?? ThemeMode.system).getName(context),
              onTap: () => showDialog(
                context: context,
                builder: (context) => const ThemeMenu(),
                useRootNavigator: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

}