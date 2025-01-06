import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accept => 'Accept';

  @override
  String get decline => 'Decline';

  @override
  String get name => 'Name';

  @override
  String get secretKey => 'Secret key';

  @override
  String get rename => 'Rename';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get addToken => 'Add token';

  @override
  String get scanQrCode => 'Scan QR-Code';

  @override
  String get renameToken => 'Rename token';

  @override
  String get confirmDeletion => 'Confirm deletion';

  @override
  String confirmDeletionOf(Object name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get confirmTokenDeletionHint => 'You may no longer be able to log in if you delete this token.\nPlease make sure that you can log in to the associated account without this token.';

  @override
  String get generatingPhonePart => 'Generating phone part';

  @override
  String get phonePart => 'Phone part:';

  @override
  String get tokens => 'Token';

  @override
  String get settings => 'Settings';

  @override
  String get pushToken => 'Push Token';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'Use device\'s theme';

  @override
  String get enablePolling => 'Enable polling';

  @override
  String get requestPushChallengesPeriodically => 'Request push challenges from the server periodically. Enable this if push challenges are not received normally.';

  @override
  String get synchronizePushTokens => 'Synchronize push tokens';

  @override
  String get synchronizesTokensWithServer => 'Synchronizes tokens with the eduMFA server.';

  @override
  String get sync => 'Sync';

  @override
  String get synchronizingTokens => 'Synchronizing tokens.';

  @override
  String get allTokensSynchronized => 'All tokens are synchronized.';

  @override
  String get synchronizationFailed => 'Synchronization failed for the following tokens, please try again:';

  @override
  String get tokensDoNotSupportSynchronization => 'The following tokens do not support synchronization and must be rolled out again:';

  @override
  String errorRollOutFailed(Object name) {
    return 'Rolling out token $name failed.';
  }

  @override
  String statusCode(Object statusCode) {
    return 'Status code: $statusCode';
  }

  @override
  String get errorSynchronizationNoNetworkConnection => 'Synchronizing tokens failed, eduMFA server could not be reached.';

  @override
  String errorRollOutNoConnectionToServer(Object name) {
    return 'Rolling out token $name failed, the server could not be reached.';
  }

  @override
  String errorRollOutUnknownError(Object e) {
    return 'An unknown error occurred. Roll-out not possible: $e';
  }

  @override
  String get rollingOut => 'Rolling out';

  @override
  String get unexpectedError => 'An unexpected error occurred.';

  @override
  String get pollingFailed => 'Polling failed.';

  @override
  String pollingFailedFor(Object serial) {
    return 'Polling failed for $serial';
  }

  @override
  String get noNetworkConnection => 'No network connection.';

  @override
  String get connectionFailed => 'Connection failed.';

  @override
  String get checkYourNetwork => 'Please check your network connection and try again.';

  @override
  String get couldNotSignMessage => 'Could not sign message.';

  @override
  String get useDeviceLocaleTitle => 'Use device language';

  @override
  String get useDeviceLocaleDescription => 'Use device language if it is supported, otherwise default to english.';

  @override
  String get language => 'Language';

  @override
  String get authenticateToShowOtp => 'Please authenticate to show one time password.';

  @override
  String get authenticateToUnLockToken => 'Please authenticate to change the lock status of the token.';

  @override
  String get biometricRequiredTitle => 'Biometrics not setup';

  @override
  String get biometricHint => 'Authentication required';

  @override
  String get biometricNotRecognized => 'Not recognized. Try again.';

  @override
  String get biometricSuccess => 'Authentication successful';

  @override
  String get deviceCredentialsRequiredTitle => 'Device credentials not set up';

  @override
  String get deviceCredentialsSetupDescription => 'Setup device credentials in the device\'s settings';

  @override
  String get signInTitle => 'Authentication required';

  @override
  String get goToSettingsButton => 'Go to settings';

  @override
  String get goToSettingsDescription => 'Authentication by credentials or biometrics is not set up on your device. Please set it up in the device\'s settings.';

  @override
  String get lockOut => 'Biometric authentication is disabled. Please lock and unlock your screen to enable it.';

  @override
  String get authNotSupportedTitle => 'Device credentials or biometrics required';

  @override
  String get authNotSupportedBody => 'This action requires the device to be secured by credentials or biometrics.';

  @override
  String get lock => 'Lock';

  @override
  String get unlock => 'Unlock';

  @override
  String get noResultTitle => 'No tokens stored yet.';

  @override
  String get noResultText1 => 'Tap the ';

  @override
  String get noResultText2 => ' button to get started!';

  @override
  String onBoardingTitle1(Object appName) {
    return '$appName';
  }

  @override
  String get onBoardingText1 => 'Two-factor authentication\nmade easy';

  @override
  String get onBoardingTitle2 => 'Maximum Security';

  @override
  String get onBoardingText2 => 'Store tokens on your device securely\nProtected by your biometrics';

  @override
  String get onBoardingTitle3 => 'Visit us at Github';

  @override
  String get onBoardingText3 => 'This app is open source';

  @override
  String get errorLogTitle => 'Error log';

  @override
  String get logMenu => 'Log menu';

  @override
  String get showErrorLog => 'Show';

  @override
  String get clearErrorLog => 'Clear';

  @override
  String get send => 'Send';

  @override
  String get sendErrorLogDescription => 'A predefined email is created.\nIt contains information about the app, the error and the device.\nYou can edit the email before sending it.\nYou can see here how we use the information:';

  @override
  String get showPrivacyPolicy => 'Show privacy policy';

  @override
  String get errorLogEmpty => 'The error log is empty.';

  @override
  String get verboseLogging => 'Verbose logging';

  @override
  String get errorLogCleared => 'Error log cleared.';

  @override
  String get ok => 'Ok';

  @override
  String get errorMailBody => 'The error log file is attached.\nYou can replace this text with additional information about the error.';

  @override
  String get showDetails => 'Show details';

  @override
  String get open => 'Open';

  @override
  String get deleteLockedToken => 'Please authenticate to delete the locked token.';

  @override
  String get editLockedToken => 'Please authenticate to edit the locked token.';

  @override
  String get retryRollout => 'Retry rollout';

  @override
  String get generatingRSAKeyPair => 'Generating RSA key pair';

  @override
  String get generatingRSAKeyPairFailed => 'Generating RSA key pair failed';

  @override
  String get sendingRSAPublicKey => 'Sending public RSA key';

  @override
  String get sendingRSAPublicKeyFailed => 'Sending public RSA key failed';

  @override
  String get parsingResponse => 'Parsing response';

  @override
  String get parsingResponseFailed => 'Parsing response failed';

  @override
  String get rolloutCompleted => 'Rollout completed';

  @override
  String get authToAcceptPushRequest => 'Please authenticate to accept the push request.';

  @override
  String get authToDeclinePushRequest => 'Please authenticate to decline the push request.';

  @override
  String get pushRequestParseError => 'Push request could not be parsed.';

  @override
  String get errorRollOutSSLHandshakeFailed => 'SSL handshake failed. Roll-out not possible.';

  @override
  String errorWhenPullingChallenges(Object name) {
    return 'An error occured when polling for challenges of $name';
  }

  @override
  String get errorRollOutNotPossibleAnymore => 'Rolling out this Token is not possible anymore.';

  @override
  String errorTokenExpired(Object name) {
    return 'The token $name has expired.';
  }

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get butDiscardIt => 'but discard it';

  @override
  String get declineIt => 'decline it';

  @override
  String get requestTriggerdByUserQuestion => 'Was this request triggered by you?';

  @override
  String get grantCameraPermissionDialogTitle => 'Camera permission is not granted';

  @override
  String get grantCameraPermissionDialogContent => 'Please grant camera permission to scan QR codes.';

  @override
  String get grantCameraPermissionDialogPermanentlyDenied => 'Camera permission is permanently denied. Please grant camera permission in your Phone\'s settings.';

  @override
  String get grantCameraPermissionDialogButton => 'Grant permission';

  @override
  String get decryptErrorTitle => 'Decryption error';

  @override
  String get decryptErrorContent => 'Unfortunately, the app was unable to decrypt your tokens. This indicates that the encryption key is broken. You can try again or delete the app data, which would delete the tokens in the app.';

  @override
  String get decryptErrorButtonDelete => 'Delete';

  @override
  String get decryptErrorButtonSendError => 'Send error';

  @override
  String get decryptErrorButtonRetry => 'Retry';

  @override
  String get decryptErrorDeleteConfirmationContent => 'Are you sure you want to delete the app data?';

  @override
  String get settingsGroupGeneral => 'General';

  @override
  String get licensesAndVersion => 'Licenses and version';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get introScanQrCode => 'You can scan QR codes to add tokens.\nWe support every common Two-Factor-Authentication token and also the eduMFA tokens.';

  @override
  String get introEditToken => 'Here you can edit the token name and see some details.';

  @override
  String get introLockToken => 'To improve security even more, you can lock tokens.\nThen the token can only be used after authentication.';

  @override
  String get introPollForChallenges => 'You can check for new challenges by dragging down the token list.';

  @override
  String get feedback => 'Feedback';

  @override
  String get feedbackTitle => 'Your feedback is always welcome!';

  @override
  String get feedbackDescription => 'If you have any questions, suggestions or problems, please let us know.';

  @override
  String get feedbackHint => 'A ready-made e-mail will open, which you can send to us. If desired, information about your device and the version of the application will be added. You can check and edit the email before sending it.';

  @override
  String get feedbackPrivacyPolicy1 => 'By sending the feedback you agree to our ';

  @override
  String get feedbackPrivacyPolicy2 => 'privacy policy';

  @override
  String get feedbackPrivacyPolicy3 => '.';

  @override
  String get addSystemInfo => 'Add system information';

  @override
  String get feedbackSentTitle => 'Feedback sent';

  @override
  String get feedbackSentDescription => 'Thank you very much for your help in making this application better!';

  @override
  String get noMailAppTitle => 'No mail app found';

  @override
  String get noMailAppDescription => 'There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message.';

  @override
  String get authenticationRequest => 'Authentication request';

  @override
  String requestInfo(Object issuer, Object account) {
    return 'Sent by $issuer for your account: \"$account\"';
  }
}
