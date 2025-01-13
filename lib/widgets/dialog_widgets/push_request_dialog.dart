import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:edumfa_authenticator/extensions/color_extension.dart';

import '../../l10n/app_localizations.dart';
import '../../model/tokens/push_token.dart';
import '../../utils/globals.dart';
import '../../utils/lock_auth.dart';
import '../../utils/riverpod_providers.dart';
import '../press_button.dart';
import 'default_dialog.dart';

class PushRequestDialog extends StatefulWidget {
  final PushToken tokenWithPushRequest;

  const PushRequestDialog(this.tokenWithPushRequest, {super.key});

  @override
  State<PushRequestDialog> createState() => _PushRequestDialogState();
}

class _PushRequestDialogState extends State<PushRequestDialog> {
  static const titleScale = 1.35;
  static const questionScale = 1.1;
  double get lineHeight => Theme.of(context).textTheme.titleLarge?.fontSize ?? 16;

  bool isHandled = false;
  bool dialogIsOpen = false;

  @override
  void dispose() {
    if (dialogIsOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        int popCount = 0;
        Navigator.of(await globalContext).popUntil((route) {
          popCount++;
          return route.isFirst || popCount > 1;
        });
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lineHeight = this.lineHeight;
    final question = widget.tokenWithPushRequest.pushRequests.peek()?.question;
    return isHandled
        ? const SizedBox()
        : Container(
            color: Colors.transparent,
            child: DefaultDialog(
              title: Text(
                AppLocalizations.of(context)!.authenticationRequest,
                style: Theme.of(context).textTheme.titleLarge!,
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.requestInfo(
                      widget.tokenWithPushRequest.issuer,
                      widget.tokenWithPushRequest.label,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: lineHeight),
                  if (question != null) ...[
                    Text(
                      question,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: lineHeight),
                  ],
                  SizedBox(
                    // Accept button
                    height: lineHeight * titleScale + 16,
                    child: PressButton(
                      onPressed: () async {
                        if (widget.tokenWithPushRequest.isLocked &&
                            await lockAuth(localizedReason: AppLocalizations.of(context)!.authToAcceptPushRequest) == false) return;
                        globalRef?.read(pushRequestProvider.notifier).acceptPop(widget.tokenWithPushRequest);
                        if (mounted) setState(() => isHandled = true);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.accept,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Icon(
                            Icons.check_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: lineHeight * 0.5),
                  SizedBox(
                    // Decline button
                    height: lineHeight * titleScale + 16,
                    child: PressButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.errorContainer)),
                        onPressed: () async {
                          if (widget.tokenWithPushRequest.isLocked &&
                              await lockAuth(localizedReason: AppLocalizations.of(context)!.authToDeclinePushRequest) == false) {
                            return;
                          }
                          dialogIsOpen = true;
                          await _showConfirmationDialog(widget.tokenWithPushRequest);
                          dialogIsOpen = false;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.decline,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                              textAlign: TextAlign.center,
                            ),
                            Icon(Icons.close_outlined),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
  }

  Future<void> _showConfirmationDialog(PushToken token) => showDialog(
      useRootNavigator: false,
      context: globalNavigatorKey.currentContext!,
      builder: (BuildContext context) {
        final lineHeight = this.lineHeight;
        return DefaultDialog(
          title: Text(
            AppLocalizations.of(context)!.authenticationRequest,
            style: Theme.of(context).textTheme.titleLarge!,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.requestTriggerdByUserQuestion,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: lineHeight),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 6,
                    child: PressButton(
                      onPressed: () {
                        globalRef?.read(pushRequestProvider.notifier).declinePop(token);
                        Navigator.of(context).pop();
                        if (mounted) setState(() => isHandled = true);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.yes,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            textAlign: TextAlign.center,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              AppLocalizations.of(context)!.butDiscardIt,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary.mixWith(Colors.grey.shade800),
                                  ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 6,
                    child: PressButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.errorContainer)),
                      onPressed: () {
                        //TODO: Notify issuer
                        globalRef?.read(pushRequestProvider.notifier).declinePop(token);
                        Navigator.of(context).pop();
                        if (mounted) setState(() => isHandled = true);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.no,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            AppLocalizations.of(context)!.declineIt,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary.mixWith(Colors.grey.shade800)),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        );
      });
}
