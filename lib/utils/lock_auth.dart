import 'dart:async';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/view_utils.dart';

bool authenticationInProgress = false;

/// Sends a request to the OS to authenticate the user. Returns true if the user was authenticated, false otherwise.
Future<bool> lockAuth({required String localizedReason}) async {
  bool didAuthenticate = false;
  LocalAuthentication localAuth = LocalAuthentication();

  if (kIsWeb || !(await localAuth.isDeviceSupported())) {
    await showAsyncDialog(
      builder: (context) {
        return DefaultDialog(
          scrollable: true,
          title: ListTile(
            title: Center(
              child: Text(
                S.of(context).authNotSupportedTitle,
                style: TextTheme.of(context).titleLarge,
              ),
            ),
            leading: const Icon(Icons.lock),
            trailing: const Icon(Icons.lock),
          ),
          content: Text(
            S.of(context).authNotSupportedBody,
          ),
        );
      },
    );
    return didAuthenticate;
  }

  AndroidAuthMessages androidAuthStrings = AndroidAuthMessages(
    signInHint: S.of(globalNavigatorKey.currentContext!).biometricHint,
    signInTitle: S.of(globalNavigatorKey.currentContext!).signInTitle,
    cancelButton: S.of(globalNavigatorKey.currentContext!).cancel,
  );

  IOSAuthMessages iOSAuthStrings = IOSAuthMessages(
    cancelButton: S.of(globalNavigatorKey.currentContext!).cancel,
  );

  try {
    if (!authenticationInProgress) {
      authenticationInProgress = true;
      didAuthenticate = await localAuth.authenticate(localizedReason: localizedReason, authMessages: [
        androidAuthStrings,
        iOSAuthStrings,
      ]);
      authenticationInProgress = false;
    }
  } on LocalAuthException catch (e, s) {
    authenticationInProgress = false;
    Logger.info("Authentication failed: ${e.code.name}", error: e, stackTrace: s);
  } on PlatformException catch (e, s) {
    authenticationInProgress = false;
    Logger.info("Authentication failed", error: e, stackTrace: s);
  }
  return didAuthenticate;
}
