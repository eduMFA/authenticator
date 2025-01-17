import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/extensions/theme_extension.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/theme_menu.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edumfa_authenticator/widgets/global_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/tokens/push_token.dart';
import '../../utils/globals.dart';
import '../../utils/riverpod_providers.dart';
import '../../widgets/push_request_listener.dart';
import '../feedback_view/feedback_view.dart';
import '../license_view/license_view.dart';
import '../view_interface.dart';
import 'settings_view_widgets/logging_menu.dart';
import 'settings_view_widgets/settings_groups.dart';
import 'settings_view_widgets/settings_list_tile_button.dart';
import 'settings_view_widgets/update_firebase_token_dialog.dart';

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

    return PushRequestListener(
      child: Scaffold(
        drawer: const DrawerWidget(),
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
                      style: Theme.of(context).textTheme.titleMedium,
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
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                  SettingsListTileButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FeedbackView.routeName);
                    },
                    title: Text(
                      'Feedback',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    icon: const Icon(FluentIcons.chat_32_regular),
                  ),
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
              SettingsGroup(
                title: S.of(context).language,
                children: [
                  SwitchListTile(
                      title: Text(
                        S.of(context).useDeviceLocaleTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        S.of(context).useDeviceLocaleDescription,
                        overflow: TextOverflow.fade,
                      ),
                      value: ref.watch(settingsProvider).useSystemLocale,
                      onChanged: (value) => ref.read(settingsProvider.notifier).setUseSystemLocale(value)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton<Locale>(
                      disabledHint: Text(
                        '${ref.watch(settingsProvider).currentLocale}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                      isExpanded: true,
                      value: ref.watch(settingsProvider).currentLocale,
                      items: S.delegate.supportedLocales.map<DropdownMenuItem<Locale>>((Locale itemLocale) {
                        return DropdownMenuItem<Locale>(
                          value: itemLocale,
                          child: Text(
                            '$itemLocale',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        );
                      }).toList(),
                      onChanged:
                      ref.watch(settingsProvider).useSystemLocale ? null : (value) => ref.read(settingsProvider.notifier).setLocalePreference(value!),
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                isActive: enablePushSettingsGroup,
                title: S.of(context).pushToken,
                children: [
                  ListTile(
                    title: Text(
                      S.of(context).synchronizePushTokens,
                      style: Theme.of(context).textTheme.titleMedium,
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
                            style: Theme.of(context).textTheme.titleMedium,
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
              const Divider(),
              SettingsGroup(
                title: S.of(context).errorLogTitle,
                children: [
                  ListTile(
                    title: Text(
                      S.of(context).logMenu,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    style: ListTileStyle.list,
                    trailing: ElevatedButton(
                      child: Text(
                        S.of(context).open,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const LoggingMenu(),
                        useRootNavigator: false,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
