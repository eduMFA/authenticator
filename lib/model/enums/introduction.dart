import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../generated/l10n.dart';
import '../../utils/riverpod_providers.dart';
import '../states/introduction_state.dart';

// Do not rename or remove JsonValue values, they are used for serialization. Only add new values.
enum Introduction {
  @JsonValue('introductionScreen')
  introductionScreen, // 1st start
  @JsonValue('scanQrCode')
  scanQrCode, // 1st start && introductionScreen
  @JsonValue('editToken')
  editToken, // 1st token && tokenSwipe
  @JsonValue('lockToken')
  lockToken, // 1st token && editToken
  @JsonValue('pollForChallenges')
  pollForChallenges, // 1st push token && lockToken
}

extension IntroductionExtension on Introduction {
  bool isConditionFulfilled(WidgetRef ref, IntroductionState state) => switch (this) {
        Introduction.introductionScreen => state.isUncompleted(Introduction.introductionScreen),
        Introduction.scanQrCode => state.isCompleted(Introduction.introductionScreen) && state.isUncompleted(Introduction.scanQrCode),
        Introduction.editToken => ref.watch(tokenProvider).pushTokens.firstOrNull?.isRolledOut == true && state.isUncompleted(Introduction.editToken),
        Introduction.lockToken => state.isCompleted(Introduction.editToken) && state.isUncompleted(Introduction.lockToken),
        Introduction.pollForChallenges => ref.watch(tokenProvider).pushTokens.firstOrNull?.isRolledOut == true &&
            state.isUncompleted(Introduction.pollForChallenges)
      };

  String hintText(BuildContext context) => switch (this) {
        Introduction.introductionScreen => '',
        Introduction.scanQrCode => S.of(context).introScanQrCode,
        Introduction.editToken => S.of(context).introEditToken,
        Introduction.lockToken => S.of(context).introLockToken,
        Introduction.pollForChallenges => S.of(context).introPollForChallenges,
      };
}
