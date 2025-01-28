import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/model/enums/push_token_rollout_state.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';

@immutable
class TokenState {
  final List<Token> tokens;
  final List<Token> lastlyUpdatedTokens;

  List<PushToken> get pushTokens => tokens.whereType<PushToken>().toList();
  bool get hasPushTokens => pushTokens.isNotEmpty;
  bool get hasRolledOutPushTokens => pushTokens.any((element) => element.isRolledOut);

  List<PushToken> get pushTokensToRollOut =>
      pushTokens.where((element) => !element.isRolledOut && element.rolloutState == PushTokenRollOutState.rolloutNotStarted).toList();

  TokenState({List<Token> tokens = const [], List<Token>? lastlyUpdatedTokens})
      : tokens = List<Token>.from(tokens),
        lastlyUpdatedTokens = lastlyUpdatedTokens ?? List<Token>.from(tokens) {
    _sort(this.tokens);
  }
  TokenState replaceList({List<Token>? tokens}) => TokenState(tokens: tokens ?? this.tokens);

  Map<Token, Token?> tokensWithSameSecret(List<Token> tokens) {
    final tokensWithSameSecret = <Token, Token?>{};
    final stateTokens = this.tokens;
    List<PushToken> pushTokens = tokens.whereType<PushToken>().toList();
    Map<(String?, String?, String?), PushToken> statePushTokens = {
      for (var e in stateTokens.whereType<PushToken>()) (e.publicServerKey, e.privateTokenKey, e.publicTokenKey): e
    };

    for (var pushToken in pushTokens) {
      tokensWithSameSecret[pushToken] = statePushTokens[(pushToken.publicServerKey, pushToken.privateTokenKey, pushToken.publicTokenKey)];
    }

    return tokensWithSameSecret;
  }

  static void _sort(List<Token> tokens) {
    tokens.sort((a, b) => (a.label).compareTo(b.label));
  }

  T? currentOf<T extends Token>(T token) => tokens.firstWhereOrNull((element) => element.id == token.id) as T?;
  T? currentOfId<T extends Token>(String id) => tokens.firstWhereOrNull((element) => element.id == id) as T?;

  TokenState withToken(Token token) {
    final newTokens = List<Token>.from(tokens);
    newTokens.add(token);
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: [token]);
  }

  TokenState withTokens(List<Token> tokens) {
    final newTokens = List<Token>.from(this.tokens);
    newTokens.addAll(tokens);
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: tokens);
  }

  // Removes the token from the State
  // Sets the lastlyUpdatedTokens to an empty list because no token was updated only removed
  TokenState withoutToken(Token token) {
    final newTokens = List<Token>.from(tokens);
    newTokens.removeWhere((element) => element.id == token.id);
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: const []);
  }

  TokenState withoutTokens(List<Token> tokens) {
    final newTokens = List<Token>.from(this.tokens);
    newTokens.removeWhere((element) => tokens.any((token) => token.id == element.id));
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: tokens);
  }

  // Add a token if it does not exist yet
  // Replace the token if it does exist
  TokenState addOrReplaceToken(Token token) {
    final newTokens = List<Token>.from(tokens);
    final index = newTokens.indexWhere((element) => element.id == token.id);
    if (index == -1) {
      newTokens.add(token);
    } else {
      newTokens[index] = token;
    }
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: [token]);
  }

  // Replace the token if it does exist
  // Do nothing if it does not exist
  TokenState replaceToken(Token token) {
    final newTokens = List<Token>.from(tokens);
    final index = newTokens.indexWhere((element) => element.id == token.id);
    if (index == -1) {
      Logger.warning('Tried to replace a token that does not exist.', name: 'token_state.dart#replaceToken');
      return this;
    }
    newTokens[index] = token;
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: [token]);
  }

  // replace all tokens where the id is the same
  // if the id is none, add it to the list
  TokenState addOrReplaceTokens(List<Token> tokens) {
    final newTokens = List<Token>.from(this.tokens);
    for (var token in tokens) {
      final index = newTokens.indexWhere((element) => element.id == token.id);
      if (index == -1) {
        newTokens.add(token);
        continue;
      }
      newTokens[index] = token;
    }
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: tokens);
  }

  // Replace the tokens if it does exist
  // Do nothing if it does not exist
  TokenState replaceTokens(List<Token> tokens) {
    final newTokens = List<Token>.from(this.tokens);
    final lastlyUpdatedTokens = <Token>[];
    for (var token in tokens) {
      final index = newTokens.indexWhere((element) => element.id == token.id);
      if (index == -1) {
        Logger.warning('Tried to replace a token that does not exist.', name: 'token_state.dart#replaceToken');
        continue;
      }
      newTokens[index] = token;
      lastlyUpdatedTokens.add(token);
    }
    return TokenState(tokens: newTokens, lastlyUpdatedTokens: lastlyUpdatedTokens);
  }

  PushToken? tokenWithPushRequest() => tokens.whereType<PushToken>().firstWhereOrNull((token) => token.pushRequests.isNotEmpty);
}
