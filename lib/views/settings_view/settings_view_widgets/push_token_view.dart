import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_tile.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/update_firebase_token_dialog.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PushTokenSettingsView extends ConsumerView {
  static const String routeName = '/push-token';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const PushTokenSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = ref.watch(tokenProvider).tokens;
    final enrolledPushTokenList = tokens.whereType<PushToken>().where((e) => e.isRolledOut).toList();
    final unsupported = enrolledPushTokenList.where((e) => e.url == null).toList();
    final enablePushSettings = enrolledPushTokenList.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pushToken),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsTile(
              icon: Icons.sync,
              title: S.of(context).synchronizePushTokens,
              subtitle: S.of(context).synchronizesTokensWithServer,
              trailing: ElevatedButton(
                onPressed: enablePushSettings
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
            SettingsTile(
              icon: Icons.how_to_vote,
              title: S.of(context).enablePolling,
              titleIcon: unsupported.isNotEmpty && enrolledPushTokenList.isNotEmpty
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {}, // () => _showPollingInfo(unsupported),
                  ) : null,
              subtitle: S.of(context).requestPushChallengesPeriodically,
              trailing: Switch(
                value: ref.watch(settingsProvider).enablePolling,
                onChanged: enablePushSettings ? (value) => ref.read(settingsProvider.notifier).setPolling(value) : null,
              ),
            ),

          ],
        ),
      ),
    );
  }

}