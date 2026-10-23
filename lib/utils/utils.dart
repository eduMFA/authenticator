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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:edumfa_authenticator/utils/logger.dart';

/// Inserts [char] at the position [pos] in the given String ([str]),
/// and returns the resulting String.
///
/// Example: insertCharAt('ABCD', ' ', 2) --> 'AB CD'
String insertCharAt(String str, String char, int pos) {
  return str.substring(0, pos) + char + str.substring(pos, str.length);
}

/// Inserts [' '] after every [period] characters in [str].
/// Trims leading and trailing whitespaces. Returns the resulting String.
///
/// Example: 'ABCD', 1 --> 'A B C D'
/// Example: 'ABCD', 2 --> 'AB CD'
///
/// If [period] is less than 1, the original String is returned.
String splitPeriodically(String str, int period) {
  if (period < 1) return str;
  String result = '';
  for (int i = 0; i < str.length; i++) {
    i % period == 0 ? result += ' ${str[i]}' : result += str[i];
  }

  return result.trim();
}

/// Checks the current permission and makes at most one request per call.
Future<void> checkNotificationPermission() async {
  if (kIsWeb || (defaultTargetPlatform != TargetPlatform.android && defaultTargetPlatform != TargetPlatform.iOS)) return;
  try {
    final status = await Permission.notification.status;
    Logger.info('Notification permission status: $status');
    if (status.isDenied || status.isPermanentlyDenied) {
      final result = await Permission.notification.request();
      Logger.info('Notification permission request result: $result');
    }
  } catch (e) {
    Logger.warning('Notification permission check failed (${e.runtimeType}).');
  }
}

String? getErrorMessageFromResponse(Response response) {
  String body = response.body;
  String? errorMessage;
  try {
    final json = jsonDecode(body) as Map<String, dynamic>;
    errorMessage = json['result']?['error']?['message'] as String?;
  } catch (e) {
    errorMessage = null;
  }
  return errorMessage;
}

Size textSizeOf(String text, TextStyle style, {int? maxLines = 1, double minWidth = 0, double maxWidth = double.infinity}) {
  final TextPainter textPainter = TextPainter(text: TextSpan(text: text, style: style), maxLines: maxLines, textDirection: TextDirection.ltr)
    ..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.size;
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width > 700;
}

bool isRunningTests() {
  return !kIsWeb && Platform.environment.containsKey('FLUTTER_TEST');
}
