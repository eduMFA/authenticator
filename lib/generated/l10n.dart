// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: 'Label for e.g. a button. Something gets accepted by the user.',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: 'Label for e.g. a button. Something gets declined by the user.',
      args: [],
    );
  }

  /// `Edit Token`
  String get editToken {
    return Intl.message(
      'Edit Token',
      name: 'editToken',
      desc: 'Title of the edit token sheet.',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: 'Describes the field where the tokens name should be entered.',
      args: [],
    );
  }

  /// `Name can't be empty`
  String get nameFieldEmpty {
    return Intl.message(
      'Name can\'t be empty',
      name: 'nameFieldEmpty',
      desc: 'Error message when the name field is empty.',
      args: [],
    );
  }

  /// `Secret key`
  String get secretKey {
    return Intl.message(
      'Secret key',
      name: 'secretKey',
      desc: 'Describes the field where the tokens secret should be entered.',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Button to cancel an action.',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Label that describes deleting the token.',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: 'Label that describes saving changes to a token.',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: 'Text of a button that closes a dialog.',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Text of a button that goes to the next page.',
      args: [],
    );
  }

  /// `Add token`
  String get addToken {
    return Intl.message(
      'Add token',
      name: 'addToken',
      desc: 'The button to open the screen to add tokens by hand.',
      args: [],
    );
  }

  /// `Pair new Push Token`
  String get addTokenTitle {
    return Intl.message(
      'Pair new Push Token',
      name: 'addTokenTitle',
      desc: 'The title of the token add screen.',
      args: [],
    );
  }

  /// `Point your camera at your screen to capture the QR code`
  String get addTokenSubtitle {
    return Intl.message(
      'Point your camera at your screen to capture the QR code',
      name: 'addTokenSubtitle',
      desc: 'The subtitle of the token add screen.',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc:
          'This is shown as a splitter between the option to add a new token by either scanning a QR code OR uploading one as a file.',
      args: [],
    );
  }

  /// `Upload QR Code`
  String get uploadQrCodeButton {
    return Intl.message(
      'Upload QR Code',
      name: 'uploadQrCodeButton',
      desc: 'The button in the token add view to upload QR codes as an image.',
      args: [],
    );
  }

  /// `Confirm deletion`
  String get confirmDeletion {
    return Intl.message(
      'Confirm deletion',
      name: 'confirmDeletion',
      desc: 'Title of the dialog where a token can be deleted.',
      args: [],
    );
  }

  /// `Are you sure you want to delete {name}?`
  String confirmDeletionOf(Object name) {
    return Intl.message(
      'Are you sure you want to delete $name?',
      name: 'confirmDeletionOf',
      desc: 'Asks for confirmation on deleting a token.',
      args: [name],
    );
  }

  /// `You may no longer be able to log in if you delete this token.\nPlease make sure that you can log in to the associated account without this token.`
  String get confirmTokenDeletionHint {
    return Intl.message(
      'You may no longer be able to log in if you delete this token.\nPlease make sure that you can log in to the associated account without this token.',
      name: 'confirmTokenDeletionHint',
      desc: 'Gives the user a hint about the consequences of deleting a token.',
      args: [],
    );
  }

  /// `Generating phone part`
  String get generatingPhonePart {
    return Intl.message(
      'Generating phone part',
      name: 'generatingPhonePart',
      desc:
          'Title of a dialog telling the user that the phone part gets generated right now.',
      args: [],
    );
  }

  /// `Phone part:`
  String get phonePart {
    return Intl.message(
      'Phone part:',
      name: 'phonePart',
      desc:
          'Title of a dialog telling the user that the phone was generated, and it is shown to the user.',
      args: [],
    );
  }

  /// `Tokens`
  String get tokens {
    return Intl.message(
      'Tokens',
      name: 'tokens',
      desc: 'Button to open the tokens page.',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Button to open the settings page.',
      args: [],
    );
  }

  /// `Push Token`
  String get pushToken {
    return Intl.message(
      'Push Token',
      name: 'pushToken',
      desc: 'Title for the settings block concerning the push tokens.',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Title of the setting group where the theme can be selected.',
      args: [],
    );
  }

  /// `Light`
  String get lightTheme {
    return Intl.message(
      'Light',
      name: 'lightTheme',
      desc: 'The light theme.',
      args: [],
    );
  }

  /// `Dark`
  String get darkTheme {
    return Intl.message(
      'Dark',
      name: 'darkTheme',
      desc: 'The dark theme.',
      args: [],
    );
  }

  /// `Auto`
  String get autoTheme {
    return Intl.message(
      'Auto',
      name: 'autoTheme',
      desc: 'The automatic theme applied by the system settings.',
      args: [],
    );
  }

  /// `Enable polling`
  String get enablePolling {
    return Intl.message(
      'Enable polling',
      name: 'enablePolling',
      desc: 'Name of the setting switch that enables polling.',
      args: [],
    );
  }

  /// `Request push challenges from the server periodically. Enable this if push challenges are not received normally.`
  String get requestPushChallengesPeriodically {
    return Intl.message(
      'Request push challenges from the server periodically. Enable this if push challenges are not received normally.',
      name: 'requestPushChallengesPeriodically',
      desc: 'The description of the polling feature.',
      args: [],
    );
  }

  /// `Synchronize push tokens`
  String get synchronizePushTokens {
    return Intl.message(
      'Synchronize push tokens',
      name: 'synchronizePushTokens',
      desc: 'Title of synchronizing push tokens in settings.',
      args: [],
    );
  }

  /// `Synchronizes tokens with the eduMFA server.`
  String get synchronizesTokensWithServer {
    return Intl.message(
      'Synchronizes tokens with the eduMFA server.',
      name: 'synchronizesTokensWithServer',
      desc: 'Description of synchronizing push tokens in settings.',
      args: [],
    );
  }

  /// `Sync`
  String get sync {
    return Intl.message(
      'Sync',
      name: 'sync',
      desc: 'Text of button that is used to synchronize push tokens.',
      args: [],
    );
  }

  /// `Synchronizing tokens.`
  String get synchronizingTokens {
    return Intl.message(
      'Synchronizing tokens.',
      name: 'synchronizingTokens',
      desc: 'Title of the push synchronization dialog.',
      args: [],
    );
  }

  /// `All tokens are synchronized.`
  String get allTokensSynchronized {
    return Intl.message(
      'All tokens are synchronized.',
      name: 'allTokensSynchronized',
      desc:
          'Content of the push synchronization dialog. Signaling the user that everything worked.',
      args: [],
    );
  }

  /// `Synchronization failed for the following tokens, please try again:`
  String get synchronizationFailed {
    return Intl.message(
      'Synchronization failed for the following tokens, please try again:',
      name: 'synchronizationFailed',
      desc: 'Headline for the list of tokens where the synchronization failed.',
      args: [],
    );
  }

  /// `The following tokens do not support synchronization and must be rolled out again:`
  String get tokensDoNotSupportSynchronization {
    return Intl.message(
      'The following tokens do not support synchronization and must be rolled out again:',
      name: 'tokensDoNotSupportSynchronization',
      desc:
          'Informs the user that the following tokens cannot be synchronized as they do not support that.',
      args: [],
    );
  }

  /// `Rolling out token {name} failed.`
  String errorRollOutFailed(Object name) {
    return Intl.message(
      'Rolling out token $name failed.',
      name: 'errorRollOutFailed',
      desc:
          'Tells the user that the token could not be rolled out, because a network error occurred.',
      args: [name],
    );
  }

  /// `Status code: {statusCode}`
  String statusCode(Object statusCode) {
    return Intl.message(
      'Status code: $statusCode',
      name: 'statusCode',
      desc: 'Tells the user the status code of the error.',
      args: [statusCode],
    );
  }

  /// `Synchronizing tokens failed, eduMFA server could not be reached.`
  String get errorSynchronizationNoNetworkConnection {
    return Intl.message(
      'Synchronizing tokens failed, eduMFA server could not be reached.',
      name: 'errorSynchronizationNoNetworkConnection',
      desc:
          'Tells the user that synchronizing the push tokens failed because the server could not be reached.',
      args: [],
    );
  }

  /// `Rolling out token {name} failed, the server could not be reached.`
  String errorRollOutNoConnectionToServer(Object name) {
    return Intl.message(
      'Rolling out token $name failed, the server could not be reached.',
      name: 'errorRollOutNoConnectionToServer',
      desc:
          'Tells the user that the roll-out failed because the server could not be reached.',
      args: [name],
    );
  }

  /// `An unknown error occurred. Roll-out not possible: {e}`
  String errorRollOutUnknownError(Object e) {
    return Intl.message(
      'An unknown error occurred. Roll-out not possible: $e',
      name: 'errorRollOutUnknownError',
      desc:
          'Tells the user that the roll-out failed because of an unknown error.',
      args: [e],
    );
  }

  /// `Rolling out`
  String get rollingOut {
    return Intl.message(
      'Rolling out',
      name: 'rollingOut',
      desc: 'Label that tells the user that the token is being rolled out.',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'unexpectedError',
      desc: 'Title of page report mode.',
      args: [],
    );
  }

  /// `Polling failed.`
  String get pollingFailed {
    return Intl.message(
      'Polling failed.',
      name: 'pollingFailed',
      desc: 'Tells the user that the polling failed.',
      args: [],
    );
  }

  /// `Polling failed for {serial}`
  String pollingFailedFor(Object serial) {
    return Intl.message(
      'Polling failed for $serial',
      name: 'pollingFailedFor',
      desc: 'Tells the user that the polling failed.',
      args: [serial],
    );
  }

  /// `No network connection.`
  String get noNetworkConnection {
    return Intl.message(
      'No network connection.',
      name: 'noNetworkConnection',
      desc: 'Tells the user that there is no network connection.',
      args: [],
    );
  }

  /// `Connection failed.`
  String get connectionFailed {
    return Intl.message(
      'Connection failed.',
      name: 'connectionFailed',
      desc: 'Tells the user that the connection failed.',
      args: [],
    );
  }

  /// `Please check your network connection and try again.`
  String get checkYourNetwork {
    return Intl.message(
      'Please check your network connection and try again.',
      name: 'checkYourNetwork',
      desc: 'Tells the user to check the network connection.',
      args: [],
    );
  }

  /// `Could not sign message.`
  String get couldNotSignMessage {
    return Intl.message(
      'Could not sign message.',
      name: 'couldNotSignMessage',
      desc: 'Tells the user that the message could not be signed.',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Title of language setting group.',
      args: [],
    );
  }

  /// `Biometrics not setup`
  String get biometricRequiredTitle {
    return Intl.message(
      'Biometrics not setup',
      name: 'biometricRequiredTitle',
      desc:
          'Message showed as a title in a dialog which indicates the user has not set up biometric authentication on their device. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Authentication required`
  String get biometricHint {
    return Intl.message(
      'Authentication required',
      name: 'biometricHint',
      desc:
          'Hint message advising the user how to authenticate with biometrics. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Not recognized. Try again.`
  String get biometricNotRecognized {
    return Intl.message(
      'Not recognized. Try again.',
      name: 'biometricNotRecognized',
      desc:
          'Message to let the user know that authentication was failed. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Authentication successful`
  String get biometricSuccess {
    return Intl.message(
      'Authentication successful',
      name: 'biometricSuccess',
      desc:
          'Message to let the user know that authentication was successful. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Device credentials not set up`
  String get deviceCredentialsRequiredTitle {
    return Intl.message(
      'Device credentials not set up',
      name: 'deviceCredentialsRequiredTitle',
      desc:
          'Message showed as a title in a dialog which indicates the user has not set up credentials authentication on their device. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Setup device credentials in the device's settings`
  String get deviceCredentialsSetupDescription {
    return Intl.message(
      'Setup device credentials in the device\'s settings',
      name: 'deviceCredentialsSetupDescription',
      desc:
          'Message advising the user to go to the settings and configure device credentials on their device. It shows in a dialog on Android side.',
      args: [],
    );
  }

  /// `Authentication required`
  String get signInTitle {
    return Intl.message(
      'Authentication required',
      name: 'signInTitle',
      desc:
          'Message showed as a title in a dialog which indicates the user that they need to scan biometric to continue. It is used on Android side. Maximum 60 characters.',
      args: [],
    );
  }

  /// `Go to settings`
  String get goToSettingsButton {
    return Intl.message(
      'Go to settings',
      name: 'goToSettingsButton',
      desc:
          'Message showed on a button that the user can click to go to settings pages from the current dialog. It is used on both Android and iOS side. Maximum 30 characters.',
      args: [],
    );
  }

  /// `Authentication by credentials or biometrics is not set up on your device. Please set it up in the device's settings.`
  String get goToSettingsDescription {
    return Intl.message(
      'Authentication by credentials or biometrics is not set up on your device. Please set it up in the device\'s settings.',
      name: 'goToSettingsDescription',
      desc:
          'Message advising the user to go to the settings and configure device credentials or biometrics on their device.',
      args: [],
    );
  }

  /// `Biometric authentication is disabled. Please lock and unlock your screen to enable it.`
  String get lockOut {
    return Intl.message(
      'Biometric authentication is disabled. Please lock and unlock your screen to enable it.',
      name: 'lockOut',
      desc:
          'Message advising the user to re-enable biometrics on their device. It shows in a dialog on iOS side.',
      args: [],
    );
  }

  /// `Device credentials or biometrics required`
  String get authNotSupportedTitle {
    return Intl.message(
      'Device credentials or biometrics required',
      name: 'authNotSupportedTitle',
      desc:
          'Message shown as a dialog title that tells the user that device credentials or biometrics must be setup for this action.',
      args: [],
    );
  }

  /// `This action requires the device to be secured by credentials or biometrics.`
  String get authNotSupportedBody {
    return Intl.message(
      'This action requires the device to be secured by credentials or biometrics.',
      name: 'authNotSupportedBody',
      desc:
          'Message shown as a dialog body that tells the user that device credentials or biometrics must be setup for this action.',
      args: [],
    );
  }

  /// `Lock`
  String get lock {
    return Intl.message(
      'Lock',
      name: 'lock',
      desc: 'Description of button that locks a token.',
      args: [],
    );
  }

  /// `Lock a token with biometric authentication.`
  String get lockDescription {
    return Intl.message(
      'Lock a token with biometric authentication.',
      name: 'lockDescription',
      desc: 'Description of the lock option when editing a token.',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Placeholder text for search bar.',
      args: [],
    );
  }

  /// `No tokens stored yet.`
  String get noResultTitle {
    return Intl.message(
      'No tokens stored yet.',
      name: 'noResultTitle',
      desc: 'No tokens stored yet.',
      args: [],
    );
  }

  /// `Tap the `
  String get noResultText1 {
    return Intl.message(
      'Tap the ',
      name: 'noResultText1',
      desc: 'first no result text',
      args: [],
    );
  }

  /// ` button to get started!`
  String get noResultText2 {
    return Intl.message(
      ' button to get started!',
      name: 'noResultText2',
      desc: 'second no result text',
      args: [],
    );
  }

  /// `Two-factor authentication\nmade easy`
  String get onBoardingText1 {
    return Intl.message(
      'Two-factor authentication\nmade easy',
      name: 'onBoardingText1',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Security`
  String get onBoardingTitle2 {
    return Intl.message(
      'Maximum Security',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Store tokens on your device securely\nProtected by your biometrics`
  String get onBoardingText2 {
    return Intl.message(
      'Store tokens on your device securely\nProtected by your biometrics',
      name: 'onBoardingText2',
      desc: '',
      args: [],
    );
  }

  /// `Visit us at Github`
  String get onBoardingTitle3 {
    return Intl.message(
      'Visit us at Github',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `This app is open source`
  String get onBoardingText3 {
    return Intl.message(
      'This app is open source',
      name: 'onBoardingText3',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `A predefined email is created.\nIt contains information about the app, the error and the device.\nYou can edit the email before sending it.\nYou can see here how we use the information:`
  String get sendErrorLogDescription {
    return Intl.message(
      'A predefined email is created.\nIt contains information about the app, the error and the device.\nYou can edit the email before sending it.\nYou can see here how we use the information:',
      name: 'sendErrorLogDescription',
      desc: 'Explanation for the user what he will send.',
      args: [],
    );
  }

  /// `Show privacy policy`
  String get showPrivacyPolicy {
    return Intl.message(
      'Show privacy policy',
      name: 'showPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `The error log file is attached.\nYou can replace this text with additional information about the error.`
  String get errorMailBody {
    return Intl.message(
      'The error log file is attached.\nYou can replace this text with additional information about the error.',
      name: 'errorMailBody',
      desc: 'Message for email body',
      args: [],
    );
  }

  /// `Show details`
  String get showDetails {
    return Intl.message(
      'Show details',
      name: 'showDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to delete the locked token.`
  String get deleteLockedToken {
    return Intl.message(
      'Please authenticate to delete the locked token.',
      name: 'deleteLockedToken',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to edit the locked token.`
  String get editLockedToken {
    return Intl.message(
      'Please authenticate to edit the locked token.',
      name: 'editLockedToken',
      desc: '',
      args: [],
    );
  }

  /// `Retry rollout`
  String get retryRollout {
    return Intl.message(
      'Retry rollout',
      name: 'retryRollout',
      desc: '',
      args: [],
    );
  }

  /// `Generating RSA key pair`
  String get generatingRSAKeyPair {
    return Intl.message(
      'Generating RSA key pair',
      name: 'generatingRSAKeyPair',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Generating RSA key pair failed`
  String get generatingRSAKeyPairFailed {
    return Intl.message(
      'Generating RSA key pair failed',
      name: 'generatingRSAKeyPairFailed',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Sending public RSA key`
  String get sendingRSAPublicKey {
    return Intl.message(
      'Sending public RSA key',
      name: 'sendingRSAPublicKey',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Sending public RSA key failed`
  String get sendingRSAPublicKeyFailed {
    return Intl.message(
      'Sending public RSA key failed',
      name: 'sendingRSAPublicKeyFailed',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Parsing response`
  String get parsingResponse {
    return Intl.message(
      'Parsing response',
      name: 'parsingResponse',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Parsing response failed`
  String get parsingResponseFailed {
    return Intl.message(
      'Parsing response failed',
      name: 'parsingResponseFailed',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Rollout completed`
  String get rolloutCompleted {
    return Intl.message(
      'Rollout completed',
      name: 'rolloutCompleted',
      desc: 'Message for the rollout process',
      args: [],
    );
  }

  /// `Please authenticate to accept the push request.`
  String get authToAcceptPushRequest {
    return Intl.message(
      'Please authenticate to accept the push request.',
      name: 'authToAcceptPushRequest',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to decline the push request.`
  String get authToDeclinePushRequest {
    return Intl.message(
      'Please authenticate to decline the push request.',
      name: 'authToDeclinePushRequest',
      desc: '',
      args: [],
    );
  }

  /// `Push request could not be parsed.`
  String get pushRequestParseError {
    return Intl.message(
      'Push request could not be parsed.',
      name: 'pushRequestParseError',
      desc: '',
      args: [],
    );
  }

  /// `SSL handshake failed. Roll-out not possible.`
  String get errorRollOutSSLHandshakeFailed {
    return Intl.message(
      'SSL handshake failed. Roll-out not possible.',
      name: 'errorRollOutSSLHandshakeFailed',
      desc:
          'Tells the user that the roll-out failed because the SSL handshake failed.',
      args: [],
    );
  }

  /// `An error occured when polling for challenges of {name}`
  String errorWhenPullingChallenges(Object name) {
    return Intl.message(
      'An error occured when polling for challenges of $name',
      name: 'errorWhenPullingChallenges',
      desc: 'errorWhenPullingChallenges',
      args: [name],
    );
  }

  /// `Rolling out this Token is not possible anymore.`
  String get errorRollOutNotPossibleAnymore {
    return Intl.message(
      'Rolling out this Token is not possible anymore.',
      name: 'errorRollOutNotPossibleAnymore',
      desc: '',
      args: [],
    );
  }

  /// `The token {name} has expired.`
  String errorTokenExpired(Object name) {
    return Intl.message(
      'The token $name has expired.',
      name: 'errorTokenExpired',
      desc: '',
      args: [name],
    );
  }

  /// `Camera permission is permanently denied. Please grant camera permission in the system settings.`
  String get cameraPermissionPermanentlyDenied {
    return Intl.message(
      'Camera permission is permanently denied. Please grant camera permission in the system settings.',
      name: 'cameraPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Grant permission`
  String get cameraPermissionPermanentlyDeniedButton {
    return Intl.message(
      'Grant permission',
      name: 'cameraPermissionPermanentlyDeniedButton',
      desc: '',
      args: [],
    );
  }

  /// `Decryption error`
  String get decryptErrorTitle {
    return Intl.message(
      'Decryption error',
      name: 'decryptErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately, the app was unable to decrypt your tokens. This indicates that the encryption key is broken. You can try again or delete the app data, which would delete the tokens in the app.`
  String get decryptErrorContent {
    return Intl.message(
      'Unfortunately, the app was unable to decrypt your tokens. This indicates that the encryption key is broken. You can try again or delete the app data, which would delete the tokens in the app.',
      name: 'decryptErrorContent',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get decryptErrorButtonDelete {
    return Intl.message(
      'Delete',
      name: 'decryptErrorButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Send error`
  String get decryptErrorButtonSendError {
    return Intl.message(
      'Send error',
      name: 'decryptErrorButtonSendError',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get decryptErrorButtonRetry {
    return Intl.message(
      'Retry',
      name: 'decryptErrorButtonRetry',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the app data?`
  String get decryptErrorDeleteConfirmationContent {
    return Intl.message(
      'Are you sure you want to delete the app data?',
      name: 'decryptErrorDeleteConfirmationContent',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get settingsGroupGeneral {
    return Intl.message(
      'General',
      name: 'settingsGroupGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Licenses and version`
  String get licensesAndVersion {
    return Intl.message(
      'Licenses and version',
      name: 'licensesAndVersion',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `No mail app found`
  String get noMailAppTitle {
    return Intl.message(
      'No mail app found',
      name: 'noMailAppTitle',
      desc: '',
      args: [],
    );
  }

  /// `There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message.`
  String get noMailAppDescription {
    return Intl.message(
      'There is no e-mail app installed or initialised on this device, please try again when you are able to send an email message.',
      name: 'noMailAppDescription',
      desc: '',
      args: [],
    );
  }

  /// `Authentication request`
  String get authenticationRequest {
    return Intl.message(
      'Authentication request',
      name: 'authenticationRequest',
      desc: '',
      args: [],
    );
  }

  /// `Sent by {issuer} for your account: "{account}"`
  String requestInfo(Object issuer, Object account) {
    return Intl.message(
      'Sent by $issuer for your account: "$account"',
      name: 'requestInfo',
      desc: 'Description of the authentication request.',
      args: [issuer, account],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
