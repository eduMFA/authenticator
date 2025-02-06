import 'dart:io';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/extensions/theme_extension.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/theme_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/license_view/license_view.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_groups.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_list_tile_button.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/update_firebase_token_dialog.dart';

class SettingsView extends ConsumerView {
  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);
  static const String routeName = '/settings';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = ref.watch(tokenProvider).tokens;
    final enrolledPushTokenList = tokens.whereType<PushToken>().where((e) => e.isRolledOut).toList();
    final unsupported = enrolledPushTokenList.where((e) => e.url == null).toList();
    final enablePushSettingsGroup = enrolledPushTokenList.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          overflow: TextOverflow.ellipsis, // maxLines: 2 only works like this.
          maxLines: 2, // Title can be shown on small screens too.
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsGroup(
              title: S.of(context).settingsGroupGeneral,
              children: [
                SettingsListTileButton(
                  onPressed: () async {
                    if (!await launchUrl(policyStatementUri)) {
                      throw Exception('Could not launch $policyStatementUri');
                    }
                  },
                  title: Text(
                    S.of(context).privacyPolicy,
                    style: TextTheme.of(context).titleMedium,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
                SettingsListTileButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LicenseView.routeName);
                  },
                  title: Text(
                    S.of(context).licensesAndVersion,
                    style: TextTheme.of(context).titleMedium,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                )
              ],
            ),
            const Divider(),
            ListTile(
              title: Text(S.of(context).theme),
              subtitle: Text((EasyDynamicTheme.of(context).themeMode ?? ThemeMode.system).getName(context)),
              onTap: () => showDialog(
                context: context,
                builder: (context) => const ThemeMenu(),
                useRootNavigator: false,
              ),
            ),
            const Divider(),
            if (showLanguageSettings()) ...[
              ListTile(
                title: Text(
                  S.of(context).language,
                  style: TextTheme.of(context).titleMedium,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                onTap: () => openAppSettings(),
              ),
              const Divider(),
            ],
            SettingsGroup(
              isActive: enablePushSettingsGroup,
              title: S.of(context).pushToken,
              children: [
                ListTile(
                  title: Text(
                    S.of(context).synchronizePushTokens,
                    style: TextTheme.of(context).titleMedium,
                  ),
                  subtitle: Text(
                    S.of(context).synchronizesTokensWithServer,
                    overflow: TextOverflow.fade,
                  ),
                  trailing: ElevatedButton(
                    onPressed: enablePushSettingsGroup
                        ? () {
                      showDialog(
                        useRootNavigator: false,
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const UpdateFirebaseTokenDialog(),
                      );
                    }
                        : null,
                    child: Text(
                      S.of(context).sync,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).enablePolling,
                          style: TextTheme.of(context).titleMedium,
                        ),
                        // Add clickable icon to inform user of unsupported push tokens (for polling)
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: unsupported.isNotEmpty && enrolledPushTokenList.isNotEmpty
                                ? GestureDetector(
                              onTap: () {}, // () => _showPollingInfo(unsupported),
                              child: const Icon(
                                Icons.info_outline,
                                color: Colors.red,
                              ),
                            )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    S.of(context).requestPushChallengesPeriodically,
                    overflow: TextOverflow.fade,
                  ),
                  trailing: Switch(
                    value: ref.watch(settingsProvider).enablePolling,
                    onChanged: enablePushSettingsGroup ? (value) => ref.read(settingsProvider.notifier).setPolling(value) : null,
                  ),
                ),
              ],
            ),
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
