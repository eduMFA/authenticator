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

import 'dart:convert';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mutex/mutex.dart';
import 'package:edumfa_authenticator/interfaces/repo/token_repository.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/view_utils.dart';

import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/send_error_dialog.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog.dart';
import 'package:edumfa_authenticator/widgets/dialog_widgets/default_dialog_button.dart';

// TODO How to test the behavior of this class?
class SecureTokenRepository implements TokenRepository {
  const SecureTokenRepository();

  // Use this to lock critical sections of code.
  static final Mutex _m = Mutex();

  /// Function [f] is executed, protected by Mutex [_m].
  /// That means, that calls of this method will always be executed serial.
  static Future<T> protect<T>(Future<T> Function() f) => _m.protect(f);

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    // Keep unreadable data until the user explicitly confirms deletion.
    aOptions: AndroidOptions(resetOnError: false),
  );

  static const String _GLOBAL_PREFIX = 'app_v3_';
  static const _iosWrites = MethodChannel('io.edumfa.authenticator/token_storage');

  static Future<void> _write(String key, String value) async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      // The plugin's update/delete/add fallback can lose the old value while locked.
      // This channel updates or adds, but never deletes an existing Keychain item.
      await _iosWrites.invokeMethod<void>('write', {'key': key, 'value': value});
    } else {
      await _storage.write(key: key, value: value);
    }
  }

  // ###########################################################################
  // TOKENS
  // ###########################################################################

  /// Saves [token]s securely on the device, if [token] already exists
  /// in the storage the existing value is overwritten.
  /// Returns all tokens that could not be saved.
  @override
  Future<List<Token>> saveOrReplaceTokens(List<Token> tokens) async {
    final failedTokens = <Token>[];
    for (var element in tokens) {
      if (!await _saveOrReplaceToken(element)) {
        failedTokens.add(element);
      }
    }
    if (failedTokens.isNotEmpty) {
      Logger.warning('Could not save all tokens to secure storage', name: 'storage_utils.dart#saveOrReplaceTokens', stackTrace: StackTrace.current);
    } else {
      Logger.info('Saved all (${tokens.length}) tokens to secure storage');
    }
    return failedTokens;
  }

  Future<bool> _saveOrReplaceToken(Token token) async {
    try {
      await _write(_GLOBAL_PREFIX + token.id, jsonEncode(token));
    } catch (e) {
      // Do not log token JSON, keys, or platform exception details containing values.
      Logger.warning(
        'Token write failed (${e.runtimeType}${e is PlatformException ? ', ${e.code}' : ''}).',
        name: 'secure_token_repository.dart#saveOrReplaceToken',
        verbose: true,
      );
      return false;
    }
    return true;
  }

  /// Returns a list of all tokens that are saved in the secure storage of
  /// this device.
  @override
  Future<List<Token>> loadTokens() async {
    late Map<String, String> keyValueMap;
    try {
      final upgradeStatus = await _storage.checkUpgradeStatus();
      if (upgradeStatus.hasDataLoss) {
        throw PlatformException(
          code: 'secure_storage_upgrade_failed',
          message: 'Secure storage requires recovery after an upgrade.',
          details: upgradeStatus.reason.name,
        );
      }
      keyValueMap = await _storage.readAll();
    } on PlatformException catch (e, s) {
      Logger.warning(
        'Token storage could not be read (${e.code}); existing records were preserved.',
        name: 'secure_token_repository.dart#loadTokens',
        stackTrace: s,
        verbose: true,
      );
      // Only a reported upgrade failure may offer a reset. Access errors do not establish corruption.
      if (e.code == 'secure_storage_upgrade_failed') {
        _decryptErrorDialog();
      } else {
        showMessage(message: 'Tokens could not be loaded. Unlock your device and retry.');
      }
      rethrow;
    }

    List<Token> tokenList = [];

    for (final entry in keyValueMap.entries) {
      if (!entry.key.startsWith(_GLOBAL_PREFIX) || entry.key == _CURRENT_APP_TOKEN_KEY || entry.key == _NEW_APP_TOKEN_KEY) {
        continue;
      }
      try {
        final serializedToken = jsonDecode(entry.value) as Map<String, dynamic>;
        serializedToken['issuer'] ??= '';
        serializedToken['label'] ??= '';
        tokenList.add(Token.fromJson(serializedToken));
      } catch (e) {
        // Preserve unreadable records for recovery and keep loading healthy tokens.
        Logger.warning(
          'Skipping an unreadable token record (${e.runtimeType}); stored data was preserved.',
          name: 'secure_token_repository.dart#loadTokens',
          verbose: true,
        );
      }
    }

    //Logger.info('Loaded ${tokenList.length} tokens from secure storage');
    return tokenList;
  }

  @override
  Future<List<Token>> deleteTokens(List<Token> tokens) async {
    final failedTokens = <Token>[];
    for (var element in tokens) {
      if (!await _deleteToken(element)) {
        failedTokens.add(element);
      }
    }
    if (failedTokens.isNotEmpty) {
      Logger.warning(
        'Could not delete all tokens from secure storage',
        name: 'storage_utils.dart#deleteTokens',
        error: 'Failed token count: ${failedTokens.length}',
        stackTrace: StackTrace.current,
      );
    }
    return failedTokens;
  }

  /// Deletes the saved json of [token] from the secure storage.
  Future<bool> _deleteToken(Token token) async {
    try {
      await _storage.delete(key: _GLOBAL_PREFIX + token.id);
    } catch (e, s) {
      Logger.warning('Could not delete token from secure storage', name: 'storage_utils.dart#deleteToken', error: e, stackTrace: s);
      return false;
    }
    Logger.info('Token deleted from secure storage');
    return true;
  }

  // ###########################################################################
  // FIREBASE CONFIG
  // ###########################################################################

  static const _CURRENT_APP_TOKEN_KEY = '${_GLOBAL_PREFIX}CURRENT_APP_TOKEN';

  static Future<void> setCurrentFirebaseToken(String str) => _write(_CURRENT_APP_TOKEN_KEY, str);

  static Future<String?> getCurrentFirebaseToken() async => _storage.read(key: _CURRENT_APP_TOKEN_KEY);

  static const _NEW_APP_TOKEN_KEY = '${_GLOBAL_PREFIX}NEW_APP_TOKEN';

  // This is used for checking if the token was updated.
  static Future<void> setNewFirebaseToken(String str) => _write(_NEW_APP_TOKEN_KEY, str);

  static Future<String?> getNewFirebaseToken() async => _storage.read(key: _NEW_APP_TOKEN_KEY);
}

Future<void> _decryptErrorDialog() => showAsyncDialog(
      barrierDismissible: false,
      builder: (context) => DefaultDialog(
        title: Text(S.of(context).decryptErrorTitle),
        content: Text(S.of(context).decryptErrorContent),
        actions: [
          DefaultDialogButton(
            onPressed: () async {
              final isDataDeleted = await _decryptErrorDeleteTokenConfirmationDialog();
              if (isDataDeleted == true) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                globalRef?.read(tokenProvider.notifier).loadStateFromRepo();
              }
            },
            child: Text(
              S.of(context).decryptErrorButtonDelete,
              style: TextStyle(color: ColorScheme.of(context).error),
            ),
          ),
          DefaultDialogButton(
              child: Text(S.of(context).decryptErrorButtonSendError),
              onPressed: () async {
                Logger.info('Sending error report', name: 'storage_utils.dart#_decryptErrorDialog');
                await showDialog(
                  context: context,
                  builder: (context) => const SendErrorDialog(),
                  useRootNavigator: false,
                );
              }),
          DefaultDialogButton(
            onPressed: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
              await Future.delayed(
                const Duration(milliseconds: 500),
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              globalRef?.read(tokenProvider.notifier).loadStateFromRepo();
            },
            child: Text(S.of(context).decryptErrorButtonRetry),
          ),
        ],
      ),
    );

Future<bool?> _decryptErrorDeleteTokenConfirmationDialog() => showAsyncDialog<bool>(
      builder: (context) => DefaultDialog(
        title: Text(S.of(context).decryptErrorTitle),
        content: Text(S.of(context).decryptErrorDeleteConfirmationContent),
        actions: [
          DefaultDialogButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(S.of(context).cancel),
          ),
          DefaultDialogButton(
            onPressed: () async {
              Logger.info(
                'Deleting all tokens from secure storage',
                name: 'storage_utils.dart#_decryptErrorDeleteTokenConfirmationDialog',
                verbose: true,
              );
              await SecureTokenRepository._storage.deleteAll();
              if (context.mounted) Navigator.pop(context, true);
            },
            child: Text(
              S.of(context).decryptErrorButtonDelete,
              style: TextStyle(color: ColorScheme.of(context).error),
            ),
          ),
        ],
      ),
    );
