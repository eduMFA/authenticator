import 'dart:async';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

import '../widgets/dialog_widgets/default_dialog.dart';
import 'globals.dart';
import 'logger.dart';
import 'view_utils.dart';

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
                style: Theme.of(context).textTheme.titleLarge,
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
    biometricRequiredTitle: S.of(globalNavigatorKey.currentContext!).biometricRequiredTitle,
    biometricHint: S.of(globalNavigatorKey.currentContext!).biometricHint,
    biometricNotRecognized: S.of(globalNavigatorKey.currentContext!).biometricNotRecognized,
    biometricSuccess: S.of(globalNavigatorKey.currentContext!).biometricSuccess,
    deviceCredentialsRequiredTitle: S.of(globalNavigatorKey.currentContext!).deviceCredentialsRequiredTitle,
    deviceCredentialsSetupDescription: S.of(globalNavigatorKey.currentContext!).deviceCredentialsSetupDescription,
    signInTitle: S.of(globalNavigatorKey.currentContext!).signInTitle,
    goToSettingsButton: S.of(globalNavigatorKey.currentContext!).goToSettingsButton,
    goToSettingsDescription: S.of(globalNavigatorKey.currentContext!).goToSettingsDescription,
    cancelButton: S.of(globalNavigatorKey.currentContext!).cancel,
  );

  IOSAuthMessages iOSAuthStrings = IOSAuthMessages(
    lockOut: S.of(globalNavigatorKey.currentContext!).lockOut,
    goToSettingsButton: S.of(globalNavigatorKey.currentContext!).goToSettingsButton,
    goToSettingsDescription: S.of(globalNavigatorKey.currentContext!).goToSettingsDescription,
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
  } on PlatformException catch (e, s) {
    authenticationInProgress = false;
    Logger.info("Authentication failed", error: e, stackTrace: s);
  }
  return didAuthenticate;
}
