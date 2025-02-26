// ignore_for_file: constant_identifier_names

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

import 'package:flutter/material.dart';

final globalSnackbarKey = GlobalKey<ScaffoldMessengerState>();
final globalNavigatorKey = GlobalKey<NavigatorState>();
final Future<GlobalKey<NavigatorState>> contextedGlobalNavigatorKey = Future(() async => await _getContextedGlobalNavigatorKey());
BuildContext? globalContextSync = globalNavigatorKey.currentContext;
final Future<BuildContext> globalContext = Future(() async => await _getContextedGlobalNavigatorKey()).then((value) => value.currentContext!);
Future<GlobalKey<NavigatorState>> _getContextedGlobalNavigatorKey() async {
  if (globalNavigatorKey.currentContext != null) {
    return globalNavigatorKey;
  } else {
    return await Future.delayed(const Duration(milliseconds: 500), _getContextedGlobalNavigatorKey);
  }
}

final appName = 'eduMFA Authenticator';
final brandColor = const Color(0xFF768FFC);
final websiteUri = Uri.parse("https://edumfa.io/");
final policyStatementUri = Uri.parse("https://edumfa.io/app-privacy");
final feedbackUrl = Uri.parse("https://edumfa.io/app-feedback");
final githubUri = Uri.parse("https://github.com/eduMFA/authenticator");
