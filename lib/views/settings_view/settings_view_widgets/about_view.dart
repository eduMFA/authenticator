import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/views/license_view/license_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_tile.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
            SettingsTile(
              icon: Icons.feedback,
              title: S.of(context).feedback,
              isLink: true,
              onTap: () => launchUrl(feedbackUrl.replace(
                  queryParameters: {"ed_Systeminfo": AppInfoUtils.systemInfoString}
              )),
            ),
            SettingsTile(
              icon: Icons.policy,
              title: S.of(context).privacyPolicy,
              isLink: true,
              onTap: () => launchUrl(policyStatementUri),
            ),
            SettingsTile(
              icon: Icons.list_alt,
              title: S.of(context).licenses,
              onTap: () => Navigator.pushNamed(context, LicenseView.routeName)
            ),
            const Divider(),
            SettingsTile(
              icon: Icons.public,
              title: S.of(context).website,
              isLink: true,
              onTap: () => launchUrl(websiteUri),
            ),
            SettingsTile(
              iconSvgAsset: 'res/logo/github.svg',
              title: S.of(context).github,
              isLink: true,
              onTap: () => launchUrl(githubUri),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${S.of(context).appVersion} ${AppInfoUtils.appVersion}',
                    style: TextTheme.of(context).labelMedium?.copyWith(
                        color: Colors.grey.shade500
                    ),
                  ),
                  SvgPicture.asset(
                    'res/logo/app_icon.svg',
                    height: IconTheme.of(context).size,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                        BlendMode.srcIn
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}