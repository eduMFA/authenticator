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

  static String m0(name) => "Are you sure you want to delete ${name}?";

  static String m1(name) => "Rolling out token ${name} failed.";

  static String m2(name) =>
      "Rolling out token ${name} failed, the server could not be reached.";

  static String m3(e) =>
      "An unknown error occurred. Roll-out not possible: ${e}";

  static String m4(name) => "The token ${name} has expired.";

  static String m5(name) =>
      "An error occured when polling for challenges of ${name}";

  static String m6(serial) => "Polling failed for ${serial}";

  static String m7(issuer, account) =>
      "Sent by ${issuer} for your account: \"${account}\"";

  static String m8(statusCode) => "Status code: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "addSystemInfo":
            MessageLookupByLibrary.simpleMessage("Add system information"),
        "addToken": MessageLookupByLibrary.simpleMessage("Add token"),
        "allTokensSynchronized": MessageLookupByLibrary.simpleMessage(
            "All tokens are synchronized."),
        "authNotSupportedBody": MessageLookupByLibrary.simpleMessage(
            "This action requires the device to be secured by credentials or biometrics."),
        "authNotSupportedTitle": MessageLookupByLibrary.simpleMessage(
            "Device credentials or biometrics required"),
        "authToAcceptPushRequest": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to accept the push request."),
        "authToDeclinePushRequest": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to decline the push request."),
        "authenticateToShowOtp": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to show one time password."),
        "authenticateToUnLockToken": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to change the lock status of the token."),
        "authenticationRequest":
            MessageLookupByLibrary.simpleMessage("Authentication request"),
        "biometricHint":
            MessageLookupByLibrary.simpleMessage("Authentication required"),
        "biometricNotRecognized":
            MessageLookupByLibrary.simpleMessage("Not recognized. Try again."),
        "biometricRequiredTitle":
            MessageLookupByLibrary.simpleMessage("Biometrics not setup"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Authentication successful"),
        "butDiscardIt": MessageLookupByLibrary.simpleMessage("but discard it"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "checkYourNetwork": MessageLookupByLibrary.simpleMessage(
            "Please check your network connection and try again."),
        "clearErrorLog": MessageLookupByLibrary.simpleMessage("Clear"),
        "confirmDeletion":
            MessageLookupByLibrary.simpleMessage("Confirm deletion"),
        "confirmDeletionOf": m0,
        "confirmTokenDeletionHint": MessageLookupByLibrary.simpleMessage(
            "You may no longer be able to log in if you delete this token.\nPlease make sure that you can log in to the associated account without this token."),
        "connectionFailed":
            MessageLookupByLibrary.simpleMessage("Connection failed."),
        "couldNotSignMessage":
            MessageLookupByLibrary.simpleMessage("Could not sign message."),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark"),
        "decline": MessageLookupByLibrary.simpleMessage("Decline"),
        "declineIt": MessageLookupByLibrary.simpleMessage("decline it"),
        "decryptErrorButtonDelete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "decryptErrorButtonRetry":
            MessageLookupByLibrary.simpleMessage("Retry"),
        "decryptErrorButtonSendError":
            MessageLookupByLibrary.simpleMessage("Send error"),
        "decryptErrorContent": MessageLookupByLibrary.simpleMessage(
            "Unfortunately, the app was unable to decrypt your tokens. This indicates that the encryption key is broken. You can try again or delete the app data, which would delete the tokens in the app."),
        "decryptErrorDeleteConfirmationContent":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete the app data?"),
        "decryptErrorTitle":
            MessageLookupByLibrary.simpleMessage("Decryption error"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteLockedToken": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to delete the locked token."),
        "deviceCredentialsRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Device credentials not set up"),
        "deviceCredentialsSetupDescription":
            MessageLookupByLibrary.simpleMessage(
                "Setup device credentials in the device\'s settings"),
        "dismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
        "editLockedToken": MessageLookupByLibrary.simpleMessage(
            "Please authenticate to edit the locked token."),
        "enablePolling": MessageLookupByLibrary.simpleMessage("Enable polling"),
        "errorLogCleared":
            MessageLookupByLibrary.simpleMessage("Error log cleared."),
        "errorLogEmpty":
            MessageLookupByLibrary.simpleMessage("The error log is empty."),
        "errorLogTitle": MessageLookupByLibrary.simpleMessage("Error log"),
        "errorMailBody": MessageLookupByLibrary.simpleMessage(
            "The error log file is attached.\nYou can replace this text with additional information about the error."),
        "errorRollOutFailed": m1,
        "errorRollOutNoConnectionToServer": m2,
        "errorRollOutNotPossibleAnymore": MessageLookupByLibrary.simpleMessage(
            "Rolling out this Token is not possible anymore."),
        "errorRollOutSSLHandshakeFailed": MessageLookupByLibrary.simpleMessage(
            "SSL handshake failed. Roll-out not possible."),
        "errorRollOutUnknownError": m3,
        "errorSynchronizationNoNetworkConnection":
            MessageLookupByLibrary.simpleMessage(
                "Synchronizing tokens failed, eduMFA server could not be reached."),
        "errorTokenExpired": m4,
        "errorWhenPullingChallenges": m5,
        "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
        "feedbackDescription": MessageLookupByLibrary.simpleMessage(
            "If you have any questions, suggestions or problems, please let us know."),
        "feedbackHint": MessageLookupByLibrary.simpleMessage(
            "A ready-made e-mail will open, which you can send to us. If desired, information about your device and the version of the application will be added. You can check and edit the email before sending it."),
        "feedbackPrivacyPolicy1": MessageLookupByLibrary.simpleMessage(
            "By sending the feedback you agree to our "),
        "feedbackPrivacyPolicy2":
            MessageLookupByLibrary.simpleMessage("privacy policy"),
        "feedbackPrivacyPolicy3": MessageLookupByLibrary.simpleMessage("."),
        "feedbackSentDescription": MessageLookupByLibrary.simpleMessage(
            "Thank you very much for your help in making this application better!"),
        "feedbackSentTitle":
            MessageLookupByLibrary.simpleMessage("Feedback sent"),
        "feedbackTitle": MessageLookupByLibrary.simpleMessage(
            "Your feedback is always welcome!"),
        "generatingPhonePart":
            MessageLookupByLibrary.simpleMessage("Generating phone part"),
        "generatingRSAKeyPair":
            MessageLookupByLibrary.simpleMessage("Generating RSA key pair"),
        "generatingRSAKeyPairFailed": MessageLookupByLibrary.simpleMessage(
            "Generating RSA key pair failed"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Go to settings"),
        "goToSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "Authentication by credentials or biometrics is not set up on your device. Please set it up in the device\'s settings."),
        "grantCameraPermissionDialogButton":
            MessageLookupByLibrary.simpleMessage("Grant permission"),
        "grantCameraPermissionDialogContent":
            MessageLookupByLibrary.simpleMessage(
                "Please grant camera permission to scan QR codes."),
        "grantCameraPermissionDialogPermanentlyDenied":
            MessageLookupByLibrary.simpleMessage(
                "Camera permission is permanently denied. Please grant camera permission in your Phone\'s settings."),
        "grantCameraPermissionDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Camera permission is not granted"),
        "introEditToken": MessageLookupByLibrary.simpleMessage(
            "Here you can edit the token name and see some details."),
        "introLockToken": MessageLookupByLibrary.simpleMessage(
            "To improve security even more, you can lock tokens.\nThen the token can only be used after authentication."),
        "introPollForChallenges": MessageLookupByLibrary.simpleMessage(
            "You can check for new challenges by dragging down the token list."),
        "introScanQrCode": MessageLookupByLibrary.simpleMessage(
            "You can scan QR codes to add tokens.\nWe support every common Two-Factor-Authentication token and also the eduMFA tokens."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "licensesAndVersion":
            MessageLookupByLibrary.simpleMessage("Licenses and version"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Light"),
        "lock": MessageLookupByLibrary.simpleMessage("Lock"),
        "lockOut": MessageLookupByLibrary.simpleMessage(
            "Biometric authentication is disabled. Please lock and unlock your screen to enable it."),
        "logMenu": MessageLookupByLibrary.simpleMessage("Log menu"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noMailAppDescription": MessageLookupByLibrary.simpleMessage(
            "There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message."),
        "noMailAppTitle":
            MessageLookupByLibrary.simpleMessage("No mail app found"),
        "noNetworkConnection":
            MessageLookupByLibrary.simpleMessage("No network connection."),
        "noResultText1": MessageLookupByLibrary.simpleMessage("Tap the "),
        "noResultText2":
            MessageLookupByLibrary.simpleMessage(" button to get started!"),
        "noResultTitle":
            MessageLookupByLibrary.simpleMessage("No tokens stored yet."),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "onBoardingText1": MessageLookupByLibrary.simpleMessage(
            "Two-factor authentication\nmade easy"),
        "onBoardingText2": MessageLookupByLibrary.simpleMessage(
            "Store tokens on your device securely\nProtected by your biometrics"),
        "onBoardingText3":
            MessageLookupByLibrary.simpleMessage("This app is open source"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Maximum Security"),
        "onBoardingTitle3":
            MessageLookupByLibrary.simpleMessage("Visit us at Github"),
        "open": MessageLookupByLibrary.simpleMessage("Open"),
        "parsingResponse":
            MessageLookupByLibrary.simpleMessage("Parsing response"),
        "parsingResponseFailed":
            MessageLookupByLibrary.simpleMessage("Parsing response failed"),
        "phonePart": MessageLookupByLibrary.simpleMessage("Phone part:"),
        "pollingFailed":
            MessageLookupByLibrary.simpleMessage("Polling failed."),
        "pollingFailedFor": m6,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "pushRequestParseError": MessageLookupByLibrary.simpleMessage(
            "Push request could not be parsed."),
        "pushToken": MessageLookupByLibrary.simpleMessage("Push Token"),
        "rename": MessageLookupByLibrary.simpleMessage("Rename"),
        "renameToken": MessageLookupByLibrary.simpleMessage("Rename token"),
        "requestInfo": m7,
        "requestPushChallengesPeriodically": MessageLookupByLibrary.simpleMessage(
            "Request push challenges from the server periodically. Enable this if push challenges are not received normally."),
        "requestTriggerdByUserQuestion": MessageLookupByLibrary.simpleMessage(
            "Was this request triggered by you?"),
        "retryRollout": MessageLookupByLibrary.simpleMessage("Retry rollout"),
        "rollingOut": MessageLookupByLibrary.simpleMessage("Rolling out"),
        "rolloutCompleted":
            MessageLookupByLibrary.simpleMessage("Rollout completed"),
        "scanQrCode": MessageLookupByLibrary.simpleMessage("Scan QR-Code"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "secretKey": MessageLookupByLibrary.simpleMessage("Secret key"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendErrorLogDescription": MessageLookupByLibrary.simpleMessage(
            "A predefined email is created.\nIt contains information about the app, the error and the device.\nYou can edit the email before sending it.\nYou can see here how we use the information:"),
        "sendingRSAPublicKey":
            MessageLookupByLibrary.simpleMessage("Sending public RSA key"),
        "sendingRSAPublicKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Sending public RSA key failed"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsGroupGeneral": MessageLookupByLibrary.simpleMessage("General"),
        "showDetails": MessageLookupByLibrary.simpleMessage("Show details"),
        "showErrorLog": MessageLookupByLibrary.simpleMessage("Show"),
        "showPrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Show privacy policy"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Authentication required"),
        "statusCode": m8,
        "sync": MessageLookupByLibrary.simpleMessage("Sync"),
        "synchronizationFailed": MessageLookupByLibrary.simpleMessage(
            "Synchronization failed for the following tokens, please try again:"),
        "synchronizePushTokens":
            MessageLookupByLibrary.simpleMessage("Synchronize push tokens"),
        "synchronizesTokensWithServer": MessageLookupByLibrary.simpleMessage(
            "Synchronizes tokens with the eduMFA server."),
        "synchronizingTokens":
            MessageLookupByLibrary.simpleMessage("Synchronizing tokens."),
        "systemTheme":
            MessageLookupByLibrary.simpleMessage("Use device\'s theme"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "tokens": MessageLookupByLibrary.simpleMessage("Tokens"),
        "tokensDoNotSupportSynchronization": MessageLookupByLibrary.simpleMessage(
            "The following tokens do not support synchronization and must be rolled out again:"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred."),
        "unlock": MessageLookupByLibrary.simpleMessage("Unlock"),
        "useDeviceLocaleDescription": MessageLookupByLibrary.simpleMessage(
            "Use device language if it is supported, otherwise default to english."),
        "useDeviceLocaleTitle":
            MessageLookupByLibrary.simpleMessage("Use device language"),
        "verboseLogging":
            MessageLookupByLibrary.simpleMessage("Verbose logging"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
