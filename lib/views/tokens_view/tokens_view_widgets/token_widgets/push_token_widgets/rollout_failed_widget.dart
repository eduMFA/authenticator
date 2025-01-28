import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/widgets/press_button.dart';

class RolloutFailedWidget extends StatelessWidget {
  final PushToken token;

  const RolloutFailedWidget({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: FittedBox(
              child: Text(
                token.rolloutState.rolloutMsg(context),
                style: TextTheme.of(context).titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.35,
                child: PressButton(
                  onPressed: () => globalRef?.read(tokenProvider.notifier).rolloutPushToken(token),
                  child: Text(
                    S.of(context).retryRollout,
                    style: TextTheme.of(context).bodyMedium,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: width * 0.35,
                child: PressButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(ColorScheme.of(context).errorContainer)),
                  onPressed: () => _showDialog(),
                  child: Text(
                    S.of(context).delete,
                    style: TextTheme.of(context).bodyMedium,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog() => showDialog(
      useRootNavigator: false,
      context: globalNavigatorKey.currentContext!,
      builder: (BuildContext context) {
        return DefaultDialog(
          scrollable: true,
          title: Text(
            S.of(context).confirmDeletion,
          ),
          content: Text(S.of(context).confirmDeletionOf(token.label)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                S.of(context).cancel,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
            TextButton(
              onPressed: () {
                globalRef?.read(tokenProvider.notifier).removeToken(token);
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).delete,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
          ],
        );
      });
}
