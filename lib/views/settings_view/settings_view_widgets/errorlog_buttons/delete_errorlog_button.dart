import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/errorlog_buttons/errorlog_button.dart';

class DeleteErrorlogButton extends StatelessWidget {
  const DeleteErrorlogButton({super.key});

  @override
  Widget build(BuildContext context) => ErrorlogButton(
        onPressed: () => _pressClearErrorLog(context),
        text: S.of(context).clearErrorLog,
      );

  void _pressClearErrorLog(BuildContext context) {
    Navigator.pop(context);
    Logger.clearErrorLog();
  }
}
