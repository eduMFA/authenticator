import 'package:flutter/material.dart';

import 'package:edumfa_authenticator/utils/identifiers.dart';
import 'package:edumfa_authenticator/model/enums/token_types.dart';
import 'package:edumfa_authenticator/model/extensions/enum_extension.dart';
import 'package:edumfa_authenticator/model/token_origin.dart';
import 'package:edumfa_authenticator/model/tokens/push_token.dart';

@immutable
abstract class Token {
  final String tokenVersion = 'v1.0.0'; // The version of this token, this is used for serialization.
  final String label; // the name of the token, it cannot be uses as an identifier
  final String issuer; // The issuer of this token, currently unused.
  final String id; // this is the identifier of the token
  final bool pin;
  final bool isLocked;
  final bool isHidden;
  Duration get showDuration;
  final String? tokenImage;

  final TokenOriginData? origin;

  // Must be string representation of TokenType enum.
  final String type; // Used to identify the token when deserializing.

  factory Token.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    if (TokenTypes.EDUMFA_PUSH.isString(type)) return PushToken.fromJson(json);
    throw ArgumentError.value(json, 'json', 'Building the token type [$type] is not a supported right now.');
  }
  factory Token.fromUriMap(
    Map<String, dynamic> uriMap,
  ) {
    String type = uriMap[URI_TYPE];
    if (TokenTypes.EDUMFA_PUSH.isString(type)) return PushToken.fromUriMap(uriMap);
    throw ArgumentError.value(uriMap, 'uri', 'Building the token type [$type] is not a supported right now.');
  }

  const Token({
    required this.label,
    required this.issuer,
    required this.id,
    required this.type,
    this.tokenImage,
    this.origin,
    bool? pin,
    bool? isLocked,
    bool? isHidden,
  })  : // when pin is true isLocked is also true otherwise it's the value of isLocked if it is null it's false
        isLocked = pin != null && pin ? true : isLocked ?? false,
        isHidden = (pin != null && pin ? true : isLocked ?? false) == false ? false : isHidden ?? false,
        pin = pin ?? false;

  /// If the type and the id are the same the tokens it is the same token (== operator).
  /// But [sameValuesAs] is used to check if a different token has the same values as this token.
  /// Id is here ignored because it is only used to identify the same the token.
  bool sameValuesAs(Token other) {
    return other.label == label &&
        other.issuer == issuer &&
        other.pin == pin &&
        other.isLocked == isLocked &&
        other.tokenImage == tokenImage &&
        other.type == type;
  }

  Token copyWith({
    String? label,
    String? issuer,
    String? id,
    bool? isLocked,
    bool? isHidden,
    bool? pin,
    String? tokenImage,
    TokenOriginData? origin,
  });

  @override
  bool operator ==(Object other) {
    return other is Token && other.id == id;
  }

  @override
  int get hashCode => (id + type).hashCode;

  @override
  String toString() {
    return 'Token{label: $label, '
        'issuer: $issuer, '
        'id: $id, '
        'pin: $pin, '
        'isLocked: $isLocked, '
        'isHidden: $isHidden, '
        'tokenImage: $tokenImage, '
        'type: $type, '
        'origin: $origin, ';
  }
}
