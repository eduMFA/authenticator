import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../model/tokens/token.dart';
import '../../../../../utils/lock_auth.dart';
import '../../../../../utils/logger.dart';
import '../../../../../utils/riverpod_providers.dart';
import '../token_action.dart';

class DefaultLockAction extends TokenAction {
  final Token token;

  const DefaultLockAction({required this.token, super.key});

  @override
  PopupMenuItem<String> build(BuildContext context, WidgetRef ref) {
    return PopupMenuItem<String>(
        value: 'lock',
        child: token.isLocked ? Text(S.of(context).unlock) : Text(S.of(context).lock) ,
        onTap: () async {
          if (await lockAuth(localizedReason: S.of(context)
              .authenticateToUnLockToken) == false) {
            return;
          }
          Logger.info(
              'Changing lock status of token to isLocked = ${!token.isLocked}',
              name: 'token_widgets.dart#_changeLockStatus');

          globalRef?.read(tokenProvider.notifier).updateToken(token, (p0) =>
              p0.copyWith(
                  isLocked: !token.isLocked, isHidden: !token.isLocked));
        });
  }
}
