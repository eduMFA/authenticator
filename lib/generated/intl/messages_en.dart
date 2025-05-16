// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(issuer, account) =>
      "Sent by ${issuer} for your account: \"${account}\"";

  static String m1(name) => "Are you sure you want to delete ${name}?";

  static String m2(name) => "Rolling out token ${name} failed.";

  static String m3(name) =>
      "Rolling out token ${name} failed, the server could not be reached.";

  static String m4(e) =>
      "An unknown error occurred. Roll-out not possible: ${e}";

  static String m5(name) => "The token ${name} has expired.";

  static String m6(name) =>
      "An error occured when polling for challenges of ${name}";

  static String m7(serial) => "Polling failed for ${serial}";

  static String m8(statusCode) => "Status code: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "addToken": MessageLookupByLibrary.simpleMessage("Add token"),
    "addTokenSubtitle": MessageLookupByLibrary.simpleMessage(
      "Point your camera at your screen to capture the QR code",
    ),
    "addTokenTitle": MessageLookupByLibrary.simpleMessage(
      "Pair new Push Token",
    ),
    "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
      "All tokens are synchronized.",
    ),
    "appVersion": MessageLookupByLibrary.simpleMessage("App Version"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
      "This action requires the device to be secured by credentials or biometrics.",
    ),
    "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
      "Device credentials or biometrics required",
    ),
    "authRequest": MessageLookupByLibrary.simpleMessage(
      "Authentication request",
    ),
    "authRequestInfo": m0,
    "authRequestQuestion": MessageLookupByLibrary.simpleMessage(
      "Do you want to confirm the authentication request?",
    ),
    "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
      "Please authenticate to accept the push request.",
    ),
    "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
      "Please authenticate to decline the push request.",
    ),
    "autoTheme": MessageLookupByLibrary.simpleMessage("Auto"),
    "biometricHint": MessageLookupByLibrary.simpleMessage(
      "Authentication required",
    ),
    "biometricNotRecognized": MessageLookupByLibrary.simpleMessage(
      "Not recognized. Try again.",
    ),
    "biometricRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "Biometrics not setup",
    ),
    "biometricSuccess": MessageLookupByLibrary.simpleMessage(
      "Authentication successful",
    ),
    "cameraPermissionPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
      "Camera permission is permanently denied. Please grant camera permission in the system settings.",
    ),
    "cameraPermissionPermanentlyDeniedButton":
        MessageLookupByLibrary.simpleMessage("Grant permission"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
      "Please check your network connection and try again.",
    ),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("Confirm deletion"),
    "confirmDeletionOf": m1,
    "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
      "You may no longer be able to log in if you delete this token.\nPlease make sure that you can log in to the associated account without this token.",
    ),
    "connectionFailed": MessageLookupByLibrary.simpleMessage(
      "Connection failed.",
    ),
    "couldNotSignMessage": MessageLookupByLibrary.simpleMessage(
      "Could not sign message.",
    ),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark"),
    "decline": MessageLookupByLibrary.simpleMessage("Decline"),
    "decryptErrorButtonDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "decryptErrorButtonRetry": MessageLookupByLibrary.simpleMessage("Retry"),
    "decryptErrorButtonSendError": MessageLookupByLibrary.simpleMessage(
      "Send error",
    ),
    "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
      "Unfortunately, the app was unable to decrypt your tokens. This indicates that the encryption key is broken. You can try again or delete the app data, which would delete the tokens in the app.",
    ),
    "decryptErrorDeleteConfirmationContent":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete the app data?",
        ),
    "decryptErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Decryption error",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
      "Please authenticate to delete the locked token.",
    ),
    "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "Device credentials not set up",
    ),
    "deviceCredentialsSetupDescription": MessageLookupByLibrary.simpleMessage(
      "Setup device credentials in the device\'s settings",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
    "editLockedToken": MessageLookupByLibrary.simpleMessage(
      "Please authenticate to edit the locked token.",
    ),
    "editToken": MessageLookupByLibrary.simpleMessage("Edit Token"),
    "enablePolling": MessageLookupByLibrary.simpleMessage("Enable polling"),
    "errorMailBody": MessageLookupByLibrary.simpleMessage(
      "The error log file is attached.\nYou can replace this text with additional information about the error.",
    ),
    "errorRollOutFailed": m2,
    "errorRollOutNoConnectionToServer": m3,
    "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
      "Rolling out this Token is not possible anymore.",
    ),
    "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
      "SSL handshake failed. Roll-out not possible.",
    ),
    "errorRollOutUnknownError": m4,
    "errorSynchronizationNoNetworkConnection":
        MessageLookupByLibrary.simpleMessage(
          "Synchronizing tokens failed, eduMFA server could not be reached.",
        ),
    "errorTokenExpired": m5,
    "errorWhenPullingChallenges": m6,
    "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "generatingPhonePart": MessageLookupByLibrary.simpleMessage(
      "Generating phone part",
    ),
    "generatingRSAKeyPair": MessageLookupByLibrary.simpleMessage(
      "Generating RSA key pair",
    ),
    "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
      "Generating RSA key pair failed",
    ),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "goToSettingsButton": MessageLookupByLibrary.simpleMessage(
      "Go to settings",
    ),
    "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
      "Authentication by credentials or biometrics is not set up on your device. Please set it up in the device\'s settings.",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "licenses": MessageLookupByLibrary.simpleMessage("Open Source Licenses"),
    "lightTheme": MessageLookupByLibrary.simpleMessage("Light"),
    "lock": MessageLookupByLibrary.simpleMessage("Lock"),
    "lockDescription": MessageLookupByLibrary.simpleMessage(
      "Lock a token with biometric authentication.",
    ),
    "lockOut": MessageLookupByLibrary.simpleMessage(
      "Biometric authentication is disabled. Please lock and unlock your screen to enable it.",
    ),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameFieldEmpty": MessageLookupByLibrary.simpleMessage(
      "Name can\'t be empty",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
      "There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message.",
    ),
    "noMailAppTitle": MessageLookupByLibrary.simpleMessage("No mail app found"),
    "noNetworkConnection": MessageLookupByLibrary.simpleMessage(
      "No network connection.",
    ),
    "noResultText1": MessageLookupByLibrary.simpleMessage("Tap the "),
    "noResultText2": MessageLookupByLibrary.simpleMessage(
      " button to get started!",
    ),
    "noResultTitle": MessageLookupByLibrary.simpleMessage(
      "No tokens stored yet.",
    ),
    "noSettingsSelected": MessageLookupByLibrary.simpleMessage(
      "Select a setting",
    ),
    "onBoardingText1": MessageLookupByLibrary.simpleMessage(
      "Two-factor authentication\nmade easy",
    ),
    "onBoardingText2": MessageLookupByLibrary.simpleMessage(
      "Store tokens on your device securely\nProtected by your biometrics",
    ),
    "onBoardingText3": MessageLookupByLibrary.simpleMessage(
      "This app is open source",
    ),
    "onBoardingTitle2": MessageLookupByLibrary.simpleMessage(
      "Maximum Security",
    ),
    "onBoardingTitle3": MessageLookupByLibrary.simpleMessage(
      "Visit us at Github",
    ),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "parsingResponse": MessageLookupByLibrary.simpleMessage("Parsing response"),
    "parsingResponseFailed": MessageLookupByLibrary.simpleMessage(
      "Parsing response failed",
    ),
    "phonePart": MessageLookupByLibrary.simpleMessage("Phone part:"),
    "pollingFailed": MessageLookupByLibrary.simpleMessage("Polling failed."),
    "pollingFailedFor": m7,
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
    "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
      "Push request could not be parsed.",
    ),
    "pushToken": MessageLookupByLibrary.simpleMessage("Push Token"),
    "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
      "Request push challenges from the server periodically. Enable this if push challenges are not received normally.",
    ),
    "retryRollout": MessageLookupByLibrary.simpleMessage("Retry rollout"),
    "rollingOut": MessageLookupByLibrary.simpleMessage("Rolling out"),
    "rolloutCompleted": MessageLookupByLibrary.simpleMessage(
      "Rollout completed",
    ),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "secretKey": MessageLookupByLibrary.simpleMessage("Secret key"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
      "A predefined email is created.\nIt contains information about the app, the error and the device.\nYou can edit the email before sending it.\nYou can see here how we use the information:",
    ),
    "sendingRSAPublicKey": MessageLookupByLibrary.simpleMessage(
      "Sending public RSA key",
    ),
    "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
      "Sending public RSA key failed",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "showDetails": MessageLookupByLibrary.simpleMessage("Show details"),
    "showPrivacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Show privacy policy",
    ),
    "signInTitle": MessageLookupByLibrary.simpleMessage(
      "Authentication required",
    ),
    "statusCode": m8,
    "sync": MessageLookupByLibrary.simpleMessage("Sync"),
    "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
      "Synchronization failed for the following tokens, please try again:",
    ),
    "synchronizePushTokens": MessageLookupByLibrary.simpleMessage(
      "Synchronize push tokens",
    ),
    "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
      "Synchronizes tokens with the eduMFA server.",
    ),
    "synchronizingTokens": MessageLookupByLibrary.simpleMessage(
      "Synchronizing tokens.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "tokens": MessageLookupByLibrary.simpleMessage("Tokens"),
    "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
      "The following tokens do not support synchronization and must be rolled out again:",
    ),
    "unexpectedError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred.",
    ),
    "uploadQrCodeButton": MessageLookupByLibrary.simpleMessage(
      "Upload QR Code",
    ),
    "website": MessageLookupByLibrary.simpleMessage("Website"),
  };
}
