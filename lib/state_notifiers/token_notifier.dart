import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:base32/base32.dart';
import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pi_authenticator_legacy/pi_authenticator_legacy.dart';
import 'package:pointycastle/asymmetric/api.dart';

import '../interfaces/repo/token_repository.dart';
import '../l10n/app_localizations.dart';
import '../model/enums/schemes.dart';
import '../model/push_request.dart';
import '../model/states/token_state.dart';
import '../model/tokens/hotp_token.dart';
import '../model/tokens/push_token.dart';
import '../model/tokens/token.dart';
import '../repo/secure_token_repository.dart';
import '../utils/customizations.dart';
import '../utils/firebase_utils.dart';
import '../utils/identifiers.dart';
import '../utils/logger.dart';
import '../utils/network_utils.dart';
import '../utils/qr_parser.dart';
import '../utils/riverpod_providers.dart';
import '../utils/rsa_utils.dart';
import '../utils/utils.dart';
import '../utils/view_utils.dart';
import '../widgets/two_step_dialog.dart';

class TokenNotifier extends StateNotifier<TokenState> {
  late Future<void> isLoading;
  final TokenRepository _repo;
  final QrParser _qrParser;
  final RsaUtils _rsaUtils;
  final LegacyUtils _legacy;
  final PrivacyIdeaIOClient _ioClient;
  final FirebaseUtils _firebaseUtils;

  TokenNotifier({
    TokenState? initialState,
    TokenRepository? repository,
    QrParser? qrParser,
    RsaUtils? rsaUtils,
    LegacyUtils? legacy,
    PrivacyIdeaIOClient? ioClient,
    FirebaseUtils? firebaseUtils,
  })  : _rsaUtils = rsaUtils ?? const RsaUtils(),
        _qrParser = qrParser ?? const QrParser(),
        _repo = repository ?? const SecureTokenRepository(),
        _legacy = legacy ?? const LegacyUtils(),
        _ioClient = ioClient ?? const PrivacyIdeaIOClient(),
        _firebaseUtils = firebaseUtils ?? FirebaseUtils(),
        super(
          initialState ?? TokenState(),
        ) {
    _init();
  }

  Future<void> _init() async {
    isLoading = Future(() async {
      await loadFromRepo();
      return;
    });
    await isLoading;
  }

  Future<void> _saveOrReplaceTokensRepo(List<Token> tokens) async {
    await isLoading;
    isLoading = Future(() async {
      final failedTokens = await _repo.saveOrReplaceTokens(tokens);
      if (failedTokens.isNotEmpty) {
        Logger.warning(
          'Saving tokens failed. Failed Tokens: ${failedTokens.length}',
          name: 'token_notifier.dart#_saveOrReplaceTokens',
        );
        state = state.addOrReplaceTokens(failedTokens);
      }
    });
    await isLoading;
  }

  Future<void> _deleteTokensRepo(List<Token> tokens) async {
    await isLoading;
    isLoading = Future(() async {
      final failedTokens = await _repo.deleteTokens(tokens);
      state = state.addOrReplaceTokens(failedTokens);
      if (state.hasPushTokens == false) {
        globalRef?.read(settingsProvider.notifier).setHidePushTokens(isHidden: false);
      }
    });
    await isLoading;
  }

  Future<bool> loadFromRepo() async {
    List<Token> tokens;
    try {
      isLoading = Future(() async {
        tokens = await _repo.loadTokens();
        state = TokenState(tokens: tokens);
        if (state.pushTokens.firstWhereOrNull((element) => element.isRolledOut == true) != null) {
          checkNotificationPermission();
        }
      });
      await isLoading;
    } catch (_) {
      return false;
    }
    return true;
  }

  Future<bool> refreshRolledOutPushTokens() async {
    await isLoading;
    List<Token> tokens;
    try {
      tokens = await _repo.loadTokens();
    } catch (_) {
      return false;
    }
    final rolledOutPushToken = tokens.whereType<PushToken>().where((element) => element.isRolledOut).toList();
    Logger.info('Refreshed ${rolledOutPushToken.length} Pushtokens from storage.', name: 'token_notifier.dart#refreshTokens');
    state = state.addOrReplaceTokens(rolledOutPushToken);
    return true;
  }

  Token? getTokenFromId(String id) {
    return state.tokens.firstWhereOrNull((element) => element.id == id);
  }

  Future<void> incrementCounter(HOTPToken token) async {
    await isLoading;
    token = state.currentOf(token)?.copyWith(counter: token.counter + 1) ?? token.copyWith(counter: token.counter + 1);
    state = state.replaceToken(token);
    await _saveOrReplaceTokensRepo([token]);
  }

  Future<void> removeToken(Token token) async {
    await isLoading;
    state = state.withoutToken(token);
    await _deleteTokensRepo([token]);
  }

  Future<void> addOrReplaceToken(Token token) async {
    await isLoading;
    state = state.addOrReplaceToken(token);
    await _saveOrReplaceTokensRepo([token]);
  }

  Future<void> addOrReplaceTokens(List<Token> updatedTokens) async {
    await isLoading;
    state = state.addOrReplaceTokens(updatedTokens);
    await _saveOrReplaceTokensRepo(updatedTokens);
  }

  Future<T?> updateToken<T extends Token>(T token, T Function(T) updater) async {
    await isLoading;
    final current = state.currentOf<T>(token);
    if (current == null) {
      Logger.warning('Tried to update a token that does not exist.', name: 'token_notifier.dart#updateToken');
      return null;
    }
    final updated = updater(current);
    state = state.replaceToken(updated);
    await _saveOrReplaceTokensRepo([updated]);
    return updated;
  }

  Future<void> updateTokens<T extends Token>(List<T> token, T Function(T) updater) async {
    await isLoading;
    List<T> updatedTokens = [];
    for (final t in token) {
      final current = state.currentOf<T>(t) ?? t;
      updatedTokens.add(updater(current));
    }
    state = state.replaceTokens(updatedTokens);
    await _saveOrReplaceTokensRepo(updatedTokens);
  }

  Future<void> handleLink(Uri uri) async {
    await isLoading;
    if (uri.scheme == enumAsString(UriSchemes.otpauth)) {
      await addTokenFromOtpAuth(otpAuth: uri.toString());
      return;
    }
    if (uri.scheme == enumAsString(UriSchemes.pia)) {
      await addTokenFromPia(pia: uri.toString());
      return;
    }
    showMessage(message: 'Scheme "${uri.scheme}" is not supported', duration: const Duration(seconds: 3));
  }

  Future<void> addTokenFromPia({required String pia}) async {
    await isLoading;
    // TODO: Implement pia:// scheme
    showMessage(message: 'Scheme "pia" is not implemented yet', duration: const Duration(seconds: 3));
  }

  Future<void> addTokenFromOtpAuth({
    required String otpAuth,
  }) async {
    await isLoading;
    Logger.info('Try to handle otpAuth:', name: 'token_notifier.dart#addTokenFromOtpAuth');

    try {
      Map<String, dynamic> uriMap = _qrParser.parseQRCodeToMap(otpAuth);
      if (_qrParser.is2StepURI(Uri.parse(otpAuth))) {
        final secret = uriMap[URI_SECRET] as Uint8List;
        // Calculate the whole secret.
        Uint8List? twoStepSecret;
        while (twoStepSecret == null) {
          twoStepSecret = (await showAsyncDialog<Uint8List>(
            barrierDismissible: false,
            builder: (BuildContext context) => GenerateTwoStepDialog(
              iterations: uriMap[URI_ITERATIONS],
              keyLength: uriMap[URI_OUTPUT_LENGTH_IN_BYTES],
              saltLength: uriMap[URI_SALT_LENGTH],
              password: secret,
            ),
          ));
          await Future.delayed(const Duration(milliseconds: 500));
        }
        uriMap[URI_SECRET] = twoStepSecret;
      }
      Token newToken;
      try {
        newToken = Token.fromUriMap(uriMap);
      } on FormatException catch (e) {
        Logger.warning('Error while parsing otpAuth.', name: 'token_notifier.dart#addTokenFromOtpAuth', error: e);
        showMessage(message: e.message, duration: const Duration(seconds: 3));
        await isLoading;
        return;
      }

      if (newToken is PushToken && state.tokens.contains(newToken)) {
        showMessage(message: 'A token with the serial ${newToken.serial} already exists!', duration: const Duration(seconds: 2));
        await isLoading;
        return;
      }
      await addOrReplaceToken(newToken);
      if (newToken is PushToken) {
        await rolloutPushToken(newToken);
      }
      return;
    } on ArgumentError catch (e, s) {
      // Error while parsing qr code.
      Logger.warning('Malformed QR code:', name: 'token_notifier.dart#_handleOtpAuth', error: e, stackTrace: s);
      showMessage(message: '${e.message}\n Please inform the creator of this qr code about the problem.', duration: const Duration(seconds: 8));

      return;
    }
  }

  Future<bool> addPushRequestToToken(PushRequest pr) async {
    await isLoading;
    PushToken? token = state.tokens.whereType<PushToken>().firstWhereOrNull((t) => t.serial == pr.serial && t.isRolledOut);
    Logger.info('Adding push request to token', name: 'token_notifier.dart#addPushRequestToToken');
    if (token == null) {
      Logger.warning('The requested token does not exist or is not rolled out.', name: 'token_notifier.dart#addPushRequestToToken');
      return false;
    }
    String signature = pr.signature;
    String signedData = '${pr.nonce}|'
        '${pr.uri}|'
        '${pr.serial}|'
        '${pr.question}|'
        '${pr.title}|'
        '${pr.sslVerify ? '1' : '0'}';

    // Re-add url and sslverify to android legacy tokens:
    if (token.url == null) {
      token = await updateToken(token, (p0) => p0.copyWith(url: pr.uri, sslVerify: pr.sslVerify));
    }
    if (token == null) {
      Logger.warning('The requested token does not exist anymore', name: 'token_notifier.dart#addPushRequestToToken');
      return false;
    }

    bool isVerified = token.privateTokenKey == null
        ? await _legacy.verify(token.serial, signedData, signature)
        : _rsaUtils.verifyRSASignature(token.rsaPublicServerKey!, utf8.encode(signedData), base32.decode(signature));

    if (!isVerified) {
      Logger.warning(
        'Validating incoming message failed.',
        name: 'token_notifier.dart#addPushRequestToToken',
        error: 'Signature does not match signed data.',
      );
      return false;
    }
    Logger.info('Validating incoming message was successful.', name: 'token_notifier.dart#addPushRequestToToken');

    if (token.knowsRequestWithId(pr.id)) {
      Logger.info(
        'The push request already exists.',
        name: 'token_notifier.dart#addPushRequestToToken',
      );
      return false;
    }
    // Save the pending request.
    token = await updateToken(token, (p0) => p0.withPushRequest(pr)) ?? token;

    // Remove the request after it expires.
    int time = pr.expirationDate.difference(DateTime.now()).inMilliseconds;
    Future.delayed(Duration(milliseconds: time < 1 ? 1 : time), () async => globalRef?.read(tokenProvider.notifier).removePushRequest(pr));
    Logger.info('Added push request ${pr.id} to token ${token.id}', name: 'token_notifier.dart#addPushRequestToToken');

    return true;
  }

  Future<bool> removePushRequest(PushRequest pushRequest) async {
    await isLoading;
    Logger.info('Removing push request ${pushRequest.id}');
    PushToken? token = state.tokens.whereType<PushToken>().firstWhereOrNull((t) => t.serial == pushRequest.serial);

    if (token == null) {
      Logger.warning('The requested token with serial "${pushRequest.serial}" does not exist.', name: 'token_notifier.dart#removePushRequest');
      return false;
    }
    token = await updateToken<PushToken>(token, (p0) => p0.withoutPushRequest(pushRequest)) ?? token;

    Logger.info('Removed push request from token ${token.id}', name: 'token_notifier.dart#removePushRequest');
    return true;
  }

  Future<bool> rolloutPushToken(PushToken token) async {
    token = (getTokenFromId(token.id)) as PushToken? ?? token;
    assert(token.url != null, 'Token url is null. Cannot rollout token without url.');
    Logger.info('Rolling out token "${token.id}"', name: 'token_notifier.dart#rolloutPushToken');
    if (token.isRolledOut) return true;
    if (token.rolloutState != PushTokenRollOutState.rolloutNotStarted &&
        token.rolloutState != PushTokenRollOutState.generatingRSAKeyPairFailed &&
        token.rolloutState != PushTokenRollOutState.sendRSAPublicKeyFailed &&
        token.rolloutState != PushTokenRollOutState.parsingResponseFailed) {
      Logger.info('Ignoring rollout request: Rollout of token "${token.id}" already started. Tokenstate: ${token.rolloutState} ',
          name: 'token_notifier.dart#rolloutPushToken');
      return false;
    }
    if (token.expirationDate?.isBefore(DateTime.now()) == true) {
      Logger.info('Ignoring rollout request: Token "${token.id}" is expired. ', name: 'token_notifier.dart#rolloutPushToken');

      if (globalNavigatorKey.currentContext != null) {
        globalRef?.read(statusMessageProvider.notifier).state = (
          AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutTokenExpired(token.label),
          null,
        );
      }
      removeToken(token);
      return false;
    }
    if (!kIsWeb && Platform.isIOS) {
      await _ioClient.triggerNetworkAccessPermission(url: token.url!, sslVerify: token.sslVerify);
    }

    if (token.privateTokenKey == null) {
      token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.generatingRSAKeyPair)) ?? token;
      try {
        final keyPair = await _rsaUtils.generateRSAKeyPair();
        token = token.withPrivateTokenKey(keyPair.privateKey);
        token = token.withPublicTokenKey(keyPair.publicKey);
        token = await updateToken(token, (p0) {
              p0 = p0.withPrivateTokenKey(keyPair.privateKey);
              return p0.withPublicTokenKey(keyPair.publicKey);
            }) ??
            token;
        Logger.info('Updated token "${token.id}"', name: 'token_notifier.dart#rolloutPushToken');
      } catch (e, s) {
        Logger.error('Error while generating RSA key pair.', name: 'token_notifier.dart#rolloutPushToken', error: e, stackTrace: s);
        token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.generatingRSAKeyPairFailed)) ?? token;
        return false;
      }
    }

    token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.sendRSAPublicKey)) ?? token;

    try {
      // TODO What to do with poll only tokens if google-services is used?

      Response response = await _ioClient.doPost(
        sslVerify: token.sslVerify,
        url: token.url!,
        body: {
          'enrollment_credential': token.enrollmentCredentials,
          'serial': token.serial,
          'fbtoken': await _firebaseUtils.getFBToken(),
          'pubkey': _rsaUtils.serializeRSAPublicKeyPKCS8(token.rsaPublicTokenKey!),
        },
      );

      if (response.statusCode == 200) {
        token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.parsingResponse)) ?? token;
        try {
          RSAPublicKey publicServerKey = await _parseRollOutResponse(response);
          token = await updateToken(token, (p0) => p0.withPublicServerKey(publicServerKey)) ?? token;
        } on FormatException catch (e, s) {
          showMessage(message: "Couldn't parsing RSA public key: ${e.message}", duration: const Duration(seconds: 3));

          Logger.warning('Error while parsing RSA public key.', name: 'token_notifier.dart#rolloutPushToken', error: e, stackTrace: s);
          token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.parsingResponseFailed)) ?? token;
          return false;
        }
        Logger.info('Roll out successful', name: 'token_notifier.dart#rolloutPushToken');
        token = await updateToken(token, (p0) => p0.copyWith(isRolledOut: true, rolloutState: PushTokenRollOutState.rolloutComplete)) ?? token;
        checkNotificationPermission();

        return true;
      } else {
        Logger.warning('Post request on roll out failed.',
            name: 'token_notifier.dart#rolloutPushToken',
            error: 'Token: ${token.serial}\nStatus code: ${response.statusCode},\nURL:${response.request?.url}\nBody: ${response.body}');

        String? message;
        try {
          message = response.body.isNotEmpty ? (json.decode(response.body)['result']?['error']?['message']) : null;
          message = message != null ? '\n$message' : '';
          showMessage(
            message: AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutFailed(token.label) + message,
            duration: const Duration(seconds: 3),
          );
        } on FormatException {
          // Format Exception is thrown if the response body is not a valid json. This happens if the server is not reachable.

          globalRef?.read(statusMessageProvider.notifier).state = (
            AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutFailed(token.label),
            AppLocalizations.of(globalNavigatorKey.currentContext!)!.statusCode(response.statusCode)
          );
        }

        token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.sendRSAPublicKeyFailed)) ?? token;
        return false;
      }
    } catch (e, s) {
      token = await updateToken(token, (p0) => p0.copyWith(rolloutState: PushTokenRollOutState.sendRSAPublicKeyFailed)) ?? token;
      if (e is PlatformException && e.code == FIREBASE_TOKEN_ERROR_CODE || e is SocketException || e is TimeoutException || e is FirebaseException) {
        Logger.warning('Connection error: Roll out push token failed.', name: 'token_notifier.dart#rolloutPushToken', error: e, stackTrace: s);
        showMessage(
          message: AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutNoConnectionToServer(token.label),
          duration: const Duration(seconds: 3),
        );
      } else if (e is HandshakeException) {
        Logger.warning('SSL error: Roll out push token failed.', name: 'token_notifier.dart#rolloutPushToken', error: e, stackTrace: s);
        showMessage(
          message: AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutSSLHandshakeFailed,
          duration: const Duration(seconds: 3),
        );
      } else {
        if (globalNavigatorKey.currentContext != null) {
          showMessage(
            message: AppLocalizations.of(globalNavigatorKey.currentContext!)!.errorRollOutUnknownError(e),
            duration: const Duration(seconds: 3),
          );
        }
        Logger.error('Roll out push token failed.', name: 'token_notifier.dart#rolloutPushToken', error: e, stackTrace: s);
      }
      return false;
    }
  }

  Future<RSAPublicKey> _parseRollOutResponse(Response response) async {
    Logger.info('Parsing rollout response, try to extract public_key.', name: 'token_notifier.dart#_parseRollOutResponse');
    try {
      String key = json.decode(response.body)['detail']['public_key'];
      key = key.replaceAll('\n', '');

      Logger.info('Extracting public key was successful.', name: 'token_notifier.dart#_parseRollOutResponse', error: key);

      return _rsaUtils.deserializeRSAPublicKeyPKCS1(key);
    } on FormatException catch (e) {
      throw FormatException('Response body does not contain RSA public key.', e);
    }
  }
}
