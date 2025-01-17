import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

enum PushTokenRollOutState {
  rolloutNotStarted,
  generatingRSAKeyPair,
  generatingRSAKeyPairFailed,
  sendRSAPublicKey,
  sendRSAPublicKeyFailed,
  parsingResponse,
  parsingResponseFailed,
  rolloutComplete,
}

extension PushTokenRollOutStateExtension on PushTokenRollOutState {
  bool get rollOutInProgress => switch (this) {
        PushTokenRollOutState.rolloutNotStarted => false,
        PushTokenRollOutState.generatingRSAKeyPair => true,
        PushTokenRollOutState.generatingRSAKeyPairFailed => false,
        PushTokenRollOutState.sendRSAPublicKey => true,
        PushTokenRollOutState.sendRSAPublicKeyFailed => false,
        PushTokenRollOutState.parsingResponse => true,
        PushTokenRollOutState.parsingResponseFailed => false,
        PushTokenRollOutState.rolloutComplete => false,
      };
  String rolloutMsg(BuildContext context) => switch (this) {
        PushTokenRollOutState.rolloutNotStarted => S.of(context).rollingOut,
        PushTokenRollOutState.generatingRSAKeyPair => S.of(context).generatingRSAKeyPair,
        PushTokenRollOutState.generatingRSAKeyPairFailed => S.of(context).generatingRSAKeyPairFailed,
        PushTokenRollOutState.sendRSAPublicKey => S.of(context).sendingRSAPublicKey,
        PushTokenRollOutState.sendRSAPublicKeyFailed => S.of(context).sendingRSAPublicKeyFailed,
        PushTokenRollOutState.parsingResponse => S.of(context).parsingResponse,
        PushTokenRollOutState.parsingResponseFailed => S.of(context).parsingResponseFailed,
        PushTokenRollOutState.rolloutComplete => S.of(context).rolloutCompleted,
      };
}
