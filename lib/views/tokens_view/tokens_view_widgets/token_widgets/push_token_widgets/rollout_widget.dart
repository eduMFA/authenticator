import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';

class RolloutWidget extends StatelessWidget {
  final PushToken token;
  const RolloutWidget({required this.token, super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(
            token.rolloutState.rolloutMsg(context),
            style: TextTheme.of(context).bodyLarge,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ],
      );
}
