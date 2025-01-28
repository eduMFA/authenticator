import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:edumfa_authenticator/widgets/push_request_listener.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';

class LicenseView extends StatelessView {
  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);
  static const String routeName = '/license';
  final String appName;
  final String websiteLink;

  const LicenseView({required this.appName, required this.websiteLink, super.key});

  @override
  Widget build(BuildContext context) => PushRequestListener(
        child: FutureBuilder(
          future: PackageInfo.fromPlatform(),
          builder: (context, platformInfo) => LicensePage(
            applicationName: appName,
            applicationIcon: Padding(
              padding: const EdgeInsets.all(32),
              child: SvgPicture.asset(
                'res/logo/app_image.svg',
                colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                    BlendMode.srcIn
                ),
              ),
            ),
            applicationLegalese: websiteLink,
            applicationVersion: platformInfo.data == null ? '' : '${platformInfo.data?.version}+${platformInfo.data?.buildNumber}',
          ),
        ),
      );
}
