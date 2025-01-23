import 'dart:ui';

import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/push_token_widgets/push_token_widget_tile.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/push_token_widgets/rollout_failed_widget.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_widgets/push_token_widgets/rollout_widget.dart';
import 'package:flutter/material.dart';


class PushTokenWidget extends StatelessWidget {
  final PushToken token;
  final bool withDivider;
  bool get rolloutFailed => switch (token.rolloutState) {
        PushTokenRollOutState.generatingRSAKeyPairFailed => true,
        PushTokenRollOutState.sendRSAPublicKeyFailed => true,
        PushTokenRollOutState.parsingResponseFailed => true,
        _ => false,
      };

  const PushTokenWidget(
    this.token, {
    this.withDivider = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PushTokenWidgetTile(token),
        ...[
          if (!token.isRolledOut)
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: rolloutFailed ? RolloutFailedWidget(token: token) : RolloutWidget(token: token),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
