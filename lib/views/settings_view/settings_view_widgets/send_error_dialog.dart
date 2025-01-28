import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';

class SendErrorDialog extends StatelessWidget {
  const SendErrorDialog({super.key});

  @override
  Widget build(BuildContext context) => DefaultDialog(
        title: Text(
          S.of(context).send,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
        content: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  S.of(context).sendErrorLogDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: TextButton(
                    child: Text(
                      S.of(context).showPrivacyPolicy,
                    ),
                    onPressed: () => launchUrl(policyStatementUri)
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              S.of(context).dismiss,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            onPressed: () => Logger.sendErrorLog(),
            child: const Icon(Icons.email),
          )
        ],
      );
}

class NoLogDialog extends StatelessWidget {
  const NoLogDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      scrollable: true,
      title: Text(
        S.of(context).errorLogEmpty,
      ),
      actions: [
        TextButton(
          child: Text(
            S.of(context).ok,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
