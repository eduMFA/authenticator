import 'dart:io';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/about_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/appearance_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/push_token_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_tile.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends ConsumerView {
  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);
  static const String routeName = '/settings';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsTile(
              icon: Icons.remove_red_eye_outlined,
              title: S.of(context).appearance,
              onTap: () => Navigator.pushNamed(context, AppearanceSettingsView.routeName),
            ),
            SettingsTile(
              icon: Icons.key,
              title: S.of(context).pushToken,
              onTap: () => Navigator.pushNamed(context, PushTokenSettingsView.routeName),
            ),
            if (showLanguageSettings()) ...[
              SettingsTile(
                icon: Icons.language,
                title: S.of(context).language,
                onTap: () => openAppSettings(),
              ),
            ],
            SettingsTile(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () => Navigator.pushNamed(context, AboutSettingsView.routeName),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.public, color: ColorScheme.of(context).primary),
                  tooltip: S.of(context).website,
                  onPressed: () => launchUrl(websiteUri),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'res/logo/github.svg',
                    height: IconTheme.of(context).size,
                    colorFilter: ColorFilter.mode(
                        ColorScheme.of(context).primary,
                        BlendMode.srcIn
                    ),
                  ),
                  tooltip: S.of(context).github,
                  onPressed: () => launchUrl(githubUri),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Per-App language setting is only available for iOS and Android 13+ (API Level 33+)
  bool showLanguageSettings() {
    if (kIsWeb) return false;
    if (Platform.isIOS) return true;
    if (Platform.isAndroid) return AppInfoUtils.androidInfo!.version.sdkInt >= 33;
    return false;
  }
}
