import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

import 'package:edumfa_authenticator/utils/view_utils.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/utils/app_info_utils.dart';
import 'package:edumfa_authenticator/utils/logger.dart';

class EduMFAMailer {
  static String get _mailRecipient => 'edumfa-support@listserv.dfn.de';
  static String _mailSubject(String? subject, String? subjectPrefix, bool subjectAppVersion) {
    String mailSubject = subjectPrefix != null ? '[$subjectPrefix] ' : '';
    if (subjectAppVersion) mailSubject += '{$appName} (${AppInfoUtils.appVersion}) ';
    if (subject != null) mailSubject += ' >>> $subject';
    return mailSubject;
  }

  static Future<bool> sendMail({
    String? subject,
    String? subjectPrefix,
    bool subjectAppVersion = true,
    required String body,
    List<String> attachments = const [],
  }) async {
    try {
      final MailOptions mailOptions = MailOptions(
        body: body,
        subject: _mailSubject(subject, subjectPrefix, subjectAppVersion),
        recipients: [_mailRecipient],
        attachments: attachments,
      );
      await FlutterMailer.send(mailOptions);
    } on PlatformException catch (e, stackTrace) {
      if (e.code == 'UNAVAILABLE') {
        showAsyncDialog(
          builder: (context) => DefaultDialog(
            title: Text(S.of(context).noMailAppTitle),
            content: Text(S.of(context).noMailAppDescription),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return false;
      }
      Logger.error('Was not able to send the Email', error: e, stackTrace: stackTrace, name: 'edumfa_mailer.dart#sendMail');
      return false;
    } catch (e, stackTrace) {
      Logger.error('Was not able to send the Email', error: e, stackTrace: stackTrace, name: 'edumfa_mailer.dart#sendMail');
      return false;
    }
    return true;
  }
}
