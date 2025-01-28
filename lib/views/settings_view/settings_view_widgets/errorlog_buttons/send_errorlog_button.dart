import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/send_error_dialog.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/errorlog_buttons/errorlog_button.dart';

class SendErrorLogButton extends StatelessWidget {
  const SendErrorLogButton({super.key});

  @override
  Widget build(BuildContext context) => ErrorlogButton(
        onPressed: () => _pressSendErrorLog(context),
        text: S.of(context).send,
      );
}

void _pressSendErrorLog(BuildContext context) {
  if (Logger.instance.logfileHasContent) {
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) => const SendErrorDialog(),
    );
  } else {
    showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) => const NoLogDialog(),
    );
  }
}
