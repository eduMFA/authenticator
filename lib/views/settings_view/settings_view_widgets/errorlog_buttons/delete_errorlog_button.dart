import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../utils/logger.dart';
import 'errorlog_button.dart';

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
