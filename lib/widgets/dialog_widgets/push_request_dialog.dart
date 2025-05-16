import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/lock_auth.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/widgets/press_button.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class PushRequestDialog extends StatefulWidget {
  final PushToken tokenWithPushRequest;

  const PushRequestDialog(this.tokenWithPushRequest, {super.key});

  @override
  State<PushRequestDialog> createState() => _PushRequestDialogState();
}

class _PushRequestDialogState extends State<PushRequestDialog> {
  double get lineHeight => TextTheme.of(context).titleLarge?.fontSize ?? 16;

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
    if (isHandled) return const SizedBox();
    return ColoredBox(
      color: Colors.transparent,
      child: DefaultDialog(
        title: Text(
          S.of(context).authRequest,
          style: TextTheme.of(context).titleLarge?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).authRequestInfo(
                widget.tokenWithPushRequest.issuer,
                widget.tokenWithPushRequest.label,
              ),
              style: TextTheme.of(context).bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: lineHeight),
            Text(
              S.of(context).authRequestQuestion,
              style: TextTheme.of(context).bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: lineHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 15,
              children: [
                Expanded(  // Accept button
                  flex: 1,
                  child: PressButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.green.shade300)),
                    onPressed: () async => await _handleAction(true),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          S.of(context).accept,
                          
                          style: TextTheme.of(context).titleMedium?.copyWith(color: Colors.green.shade900),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.green.shade900,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded( // Decline button
                  flex: 1,
                  child: PressButton(
                      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red.shade200)),
                      onPressed: () async => await _handleAction(false),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            S.of(context).decline,
                            style: TextTheme.of(context).titleMedium?.copyWith(color: Colors.red.shade900),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.close_outlined,
                            color: Colors.red.shade900,
                          ),
                        ],
                      )),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(bool success) async {
    final localizedReason = success ? S.of(context).authToAcceptPushRequest : S.of(context).authToDeclinePushRequest;
    if (widget.tokenWithPushRequest.isLocked && !await lockAuth(localizedReason: localizedReason)) return;
    success
        ? globalRef?.read(pushRequestProvider.notifier).acceptPop(widget.tokenWithPushRequest)
        : globalRef?.read(pushRequestProvider.notifier).declinePop(widget.tokenWithPushRequest);

    await Haptics.vibrate(HapticsType.success);

    // dialogIsOpen = true;
    // await _showConfirmationDialog(widget.tokenWithPushRequest);
    // dialogIsOpen = false;

    if (mounted) setState(() => isHandled = true);
  }

  //Future<void> _showConfirmationDialog(PushToken token) => showDialog(
  //    useRootNavigator: false,
  //    context: globalNavigatorKey.currentContext!,
  //    builder: (BuildContext context) {
  //      final lineHeight = this.lineHeight;
  //      return DefaultDialog(
  //        title: Text(
  //          S.of(context).authRequest,
  //          style: TextTheme.of(context).titleLarge!,
  //          textAlign: TextAlign.center,
  //        ),
  //        content: Column(
  //          mainAxisSize: MainAxisSize.min,
  //          crossAxisAlignment: CrossAxisAlignment.stretch,
  //          children: [
  //            Text(
  //              S.of(context).requestTriggerdByUserQuestion,
  //              style: TextTheme.of(context).bodyLarge?.copyWith(fontSize: TextTheme.of(context).titleMedium?.fontSize),
  //              textAlign: TextAlign.center,
  //            ),
  //            SizedBox(height: lineHeight),
  //            Row(
  //              mainAxisSize: MainAxisSize.max,
  //              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //              children: [
  //                const Expanded(child: SizedBox()),
  //                Expanded(
  //                  flex: 6,
  //                  child: PressButton(
  //                    onPressed: () {
  //                      globalRef?.read(pushRequestProvider.notifier).declinePop(token);
  //                      Navigator.of(context).pop();
  //                      if (mounted) setState(() => isHandled = true);
  //                    },
  //                    child: Column(
  //                      mainAxisSize: MainAxisSize.min,
  //                      children: [
  //                        Text(
  //                          S.of(context).yes,
  //                          style: TextTheme.of(context).bodyLarge?.copyWith(color: ColorScheme.of(context).onPrimary),
  //                          textAlign: TextAlign.center,
  //                        ),
  //                        FittedBox(
  //                          fit: BoxFit.scaleDown,
  //                          child: Text(
  //                            S.of(context).butDiscardIt,
  //                            style: TextTheme.of(context).bodySmall?.copyWith(
  //                                  color: ColorScheme.of(context).onPrimary.mixWith(Colors.grey.shade800),
  //                                ),
  //                            textAlign: TextAlign.center,
  //                            softWrap: false,
  //                          ),
  //                        ),
  //                      ],
  //                    ),
  //                  ),
  //                ),
  //                const Expanded(flex: 2, child: SizedBox()),
  //                Expanded(
  //                  flex: 6,
  //                  child: PressButton(
  //                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(ColorScheme.of(context).errorContainer)),
  //                    onPressed: () {
  //                      //TODO: Notify issuer
  //                      globalRef?.read(pushRequestProvider.notifier).declinePop(token);
  //                      Navigator.of(context).pop();
  //                      if (mounted) setState(() => isHandled = true);
  //                    },
  //                    child: Column(
  //                      mainAxisSize: MainAxisSize.min,
  //                      children: [
  //                        Text(
  //                          S.of(context).no,
  //                          style: TextTheme.of(context).bodyLarge?.copyWith(color: ColorScheme.of(context).onPrimary),
  //                          textAlign: TextAlign.center,
  //                        ),
  //                        Text(
  //                          S.of(context).declineIt,
  //                          style:
  //                              TextTheme.of(context).bodySmall?.copyWith(color: ColorScheme.of(context).onPrimary.mixWith(Colors.grey.shade800)),
  //                          textAlign: TextAlign.center,
  //                          softWrap: false,
  //                        ),
  //                      ],
  //                    ),
  //                  ),
  //                ),
  //                const Expanded(child: SizedBox()),
  //              ],
  //            ),
  //          ],
  //        ),
  //      );
  //    });
}
