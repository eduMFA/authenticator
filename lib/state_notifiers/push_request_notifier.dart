/*
  This file is part of eduMFA Authenticator. eduMFA Authenticator is a fork of privacyIDEA Authenticator.
  Copyright (c) 2024 eduMFA Project-Team

  Previous authors by privacyIDEA project:
  Timo Sturm <timo.sturm@netknights.it>
  Frank Merkel <frank.merkel@netknights.it>

  Copyright (c) 2017-2023 NetKnights GmbH

  Licensed under the Apache License, Version 2.0 (the 'License');
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an 'AS IS' BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:edumfa_authenticator/model/push_request.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/utils/firebase_utils.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/network_utils.dart';
import 'package:edumfa_authenticator/utils/push_provider.dart';
import 'package:edumfa_authenticator/utils/rsa_utils.dart';

/// Interface between the [PushProvider] and the UI.
class PushRequestNotifier extends StateNotifier<PushRequest?> {
  // Used for periodically polling for push challenges

  final PushProvider _pushProvider;
  final EduMFAIOClient _ioClient;
  final RsaUtils _rsaUtils;

  PushRequestNotifier({
    PushRequest? initState,
    PushProvider? pushProvider,
    EduMFAIOClient? ioClient,
    RsaUtils? rsaUtils,
    FirebaseUtils? firebaseUtils,
  })  : _ioClient = ioClient ?? const EduMFAIOClient(),
        _pushProvider = pushProvider ?? PushProvider(),
        _rsaUtils = rsaUtils ?? const RsaUtils(),
        super(initState) {
    _pushProvider.initialize(pushSubscriber: this, firebaseUtils: firebaseUtils ?? FirebaseUtils());
  }

  // ACTIONS
  Future<bool> acceptPop(PushToken pushToken) async {
    final pushRequest = pushToken.pushRequests.tryPop();
    if (pushRequest == null) return false;
    Logger.info('Approving push request.', name: 'push_request_notifier.dart#approve');
    final updatedPushRequest = pushRequest.copyWith(accepted: true);
    final successfullyApproved = await _handleReaction(pushRequest: updatedPushRequest, token: pushToken);
    if (!successfullyApproved) {
      pushToken.pushRequests.add(pushRequest);
      return false;
    }
    state = updatedPushRequest;
    return true;
  }

  Future<bool> declinePop(PushToken pushToken) async {
    final pushRequest = pushToken.pushRequests.tryPop();
    if (pushRequest == null) return false;
    Logger.info('Decline push request.', name: 'push_request_notifier.dart#decline');
    final updatedPushRequest = pushRequest.copyWith(accepted: false);
    final successfullyDeclined = await _handleReaction(pushRequest: updatedPushRequest, token: pushToken);
    if (!successfullyDeclined) {
      pushToken.pushRequests.add(pushRequest);
      return false;
    }
    state = updatedPushRequest;
    return successfullyDeclined;
  }

  void newRequest(PushRequest pushRequest) => state = pushRequest;

  Future<bool> _handleReaction({required PushRequest pushRequest, required PushToken token}) async {
    if (pushRequest.accepted == null) return false;

    Logger.info('Push auth request accepted=${pushRequest.accepted}, sending response to edumfa', name: 'token_widgets.dart#handleReaction');

    // signature ::=  {nonce}|{serial}[|decline]
    String msg = '${pushRequest.nonce}|${token.serial}';
    if (pushRequest.accepted! == false) {
      msg += '|decline';
    }
    String? signature = await _rsaUtils.trySignWithToken(token, msg);
    if (signature == null) {
      return false;
    }

    //    POST https://edumfaserver/validate/check
    //    nonce=<nonce_from_request>
    //    serial=<serial>
    //    signature=<signature>
    //    decline=1 (optional)
    final Map<String, String> body = {
      'nonce': pushRequest.nonce,
      'serial': token.serial,
      'signature': signature,
    };
    if (pushRequest.accepted! == false) {
      body["decline"] = "1";
    }

    Response response = await _ioClient.doPost(sslVerify: pushRequest.sslVerify, url: pushRequest.uri, body: body);
    if (response.statusCode != 200) {
      Logger.warning('Sending push request response failed.', name: 'token_widgets.dart#handleReaction');
      return false;
    }

    return true;
  }
}
