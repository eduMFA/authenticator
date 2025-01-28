import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/lock_auth.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/token_action.dart';

class DefaultEditAction extends TokenAction {
  final Token token;

  const DefaultEditAction({required this.token, super.key});

  @override
  PopupMenuItem<String> build(BuildContext context, WidgetRef ref) {
    return PopupMenuItem<String>(
        value: 'edit',
        child: Text(S.of(context).rename),
        onTap: () async {
          if (token.isLocked &&
              await lockAuth(localizedReason: S.of(context).editLockedToken) == false) {
            return;
          }
          _showDialog();
        });
  }

  void _showDialog() {
    TextEditingController nameInputController =
        TextEditingController(text: token.label);
    showDialog(
        useRootNavigator: false,
        context: globalNavigatorKey.currentContext!,
        builder: (BuildContext context) {
          return DefaultDialog(
            scrollable: true,
            title: Text(
              S.of(context).renameToken,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
            content: TextFormField(
              autofocus: true,
              controller: nameInputController,
              onChanged: (value) {},
              decoration: InputDecoration(
                  labelText: S.of(context).name),
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).name;
                }
                return null;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  S.of(context).cancel,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(
                  S.of(context).rename,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                onPressed: () {
                  final newLabel = nameInputController.text.trim();
                  if (newLabel.isEmpty) return;
                  globalRef
                      ?.read(tokenProvider.notifier)
                      .updateToken(token, (p0) => p0.copyWith(label: newLabel));

                  Logger.info(
                    'Renamed token:',
                    name: 'token_widget_base.dart#TextButton#renameClicked',
                    error: '\'${token.label}\' changed to \'$newLabel\'',
                  );

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
