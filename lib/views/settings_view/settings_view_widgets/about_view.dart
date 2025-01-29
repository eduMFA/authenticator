import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/extensions/theme_extension.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_tile.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/theme_menu.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';

class AboutSettingsView extends StatelessView {
  static const String routeName = '/about';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const AboutSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }

}