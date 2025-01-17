import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../model/tokens/token.dart';
import '../utils/lock_auth.dart';

class HideableWidgetTrailing extends StatelessWidget {
  final Token token;
  final ValueNotifier<bool> isHiddenNotifier;
  final Widget child;
  const HideableWidgetTrailing({
    required this.child,
    required this.token,
    required this.isHiddenNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return token.isLocked && isHiddenNotifier.value
        ? IconButton(
            onPressed: () async {
              if (await lockAuth(localizedReason: S.of(context).authenticateToShowOtp)) {
                isHiddenNotifier.value = false;
              }
            },
            icon: const Icon(Icons.remove_red_eye_outlined),
          )
        : child;
  }
}
