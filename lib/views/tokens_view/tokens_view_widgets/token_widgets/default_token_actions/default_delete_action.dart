import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/tokens/token.dart';
import '../../../../../utils/globals.dart';
import '../../../../../utils/lock_auth.dart';
import '../../../../../utils/riverpod_providers.dart';
import '../../../../../widgets/dialog_widgets/default_dialog.dart';
import '../token_action.dart';

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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
              content: Column(
                children: [
                  Text(S.of(context).confirmDeletionOf(token.label), style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).confirmTokenDeletionHint,
                    style: Theme.of(context).textTheme.bodySmall,
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
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ],
            );
          });
}
