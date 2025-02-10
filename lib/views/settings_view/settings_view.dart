import 'dart:io';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/utils.dart';
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

enum SettingOption { appearance, pushToken, about }

class SettingsView extends ConsumerStatefulView {
  static const String routeName = '/settings';

  const SettingsView({super.key});

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  SettingOption? _selectedSetting;

  Widget _buildDetailView(BuildContext context) {
    switch (_selectedSetting) {
      case SettingOption.appearance:
        return const AppearanceSettingsView();
      case SettingOption.pushToken:
        return const PushTokenSettingsView();
      case SettingOption.about:
        return const AboutSettingsView();
      default:
        return Center(child: Text(S.of(context).noSettingsSelected));
    }
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required SettingOption option,
    required VoidCallback mobileOnTap,
  }) {
    return SettingsTile(
      icon: icon,
      title: title,
      onTap: () {
        if (isTablet(context)) {
          setState(() => _selectedSetting = option);
        } else {
          mobileOnTap();
        }
      },
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.public, color: Theme.of(context).primaryColor),
          tooltip: S.of(context).website,
          onPressed: () => launchUrl(websiteUri),
        ),
        IconButton(
          icon: SvgPicture.asset(
            'res/logo/github.svg',
            height: IconTheme.of(context).size,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          tooltip: S.of(context).github,
          onPressed: () => launchUrl(githubUri),
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.remove_red_eye_outlined,
            title: S.of(context).appearance,
            option: SettingOption.appearance,
            mobileOnTap: () => Navigator.pushNamed(
              context,
              AppearanceSettingsView.routeName,
            ),
          ),
          _buildSettingsTile(
            icon: Icons.key,
            title: S.of(context).pushToken,
            option: SettingOption.pushToken,
            mobileOnTap: () => Navigator.pushNamed(
              context,
              PushTokenSettingsView.routeName,
            ),
          ),
          if (showLanguageSettings())
            SettingsTile(
              icon: Icons.language,
              title: S.of(context).language,
              onTap: () => openAppSettings(),
            ),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'About',
            option: SettingOption.about,
            mobileOnTap: () => Navigator.pushNamed(
              context,
              AboutSettingsView.routeName,
            ),
          ),
          _buildSocialLinks(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTabletDevice = isTablet(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: isTabletDevice
          ? Row(
        children: [
          // Left: Settings list
          Expanded(flex: 1, child: _buildSettingsList()),
          const VerticalDivider(width: 1),
          // Right: Detail view
          Expanded(flex: 2, child: _buildDetailView(context)),
        ],
      )
          : _buildSettingsList(),
    );
  }

  // Only show language settings on iOS and Android 13+ (API level 33+)
  bool showLanguageSettings() {
    if (kIsWeb) return false;
    if (Platform.isIOS) return true;
    if (Platform.isAndroid) {
      return AppInfoUtils.androidInfo!.version.sdkInt >= 33;
    }
    return false;
  }
}
