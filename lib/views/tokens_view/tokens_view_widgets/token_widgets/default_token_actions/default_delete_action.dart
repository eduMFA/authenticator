import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/lock_auth.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_action.dart';

class DefaultDeleteAction extends TokenAction {
  final Token token;

  const DefaultDeleteAction({super.key, required this.token});

  @override
  PopupMenuItem<String> build(BuildContext context, WidgetRef ref) {
    return PopupMenuItem<String>(
        value: 'delete',
        child: Text(S.of(context).delete),
        onTap: () async {
          if (token.isLocked && await lockAuth(localizedReason: S.of(context).deleteLockedToken) == false) {
            return;
          }
          _showDialog();
        });
  }


  void _showDialog() => globalNavigatorKey.currentContext == null
      ? null
      : showDialog(
          useRootNavigator: false,
          context: globalNavigatorKey.currentContext!,
          builder: (BuildContext context) {
            return DefaultDialog(
              scrollable: true,
              title: Text(
                S.of(context).confirmDeletion,
                style: TextTheme.of(context).titleLarge?.copyWith(
                    color: ColorScheme.of(context).error
                ),
              ),
              content: Column(
                children: [
                  Text(
                      S.of(context).confirmDeletionOf(token.label),
                      style: TextTheme.of(context).bodyMedium
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).confirmTokenDeletionHint,
                    style: TextTheme.of(context).bodySmall,
                  ),
                ],
              ),
              actions: [
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
                    style: TextStyle(color: ColorScheme.of(context).error),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ],
            );
          });
}
