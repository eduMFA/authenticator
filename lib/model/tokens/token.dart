import 'package:flutter/material.dart';

import '../../utils/identifiers.dart';
import '../../utils/utils.dart';
import '../mixins/sortable_mixin.dart';
import 'day_password_token.dart';
import 'hotp_token.dart';
import 'push_token.dart';
import 'totp_token.dart';

@immutable
abstract class Token with SortableMixin {
  final String tokenVersion = 'v1.0.0'; // The version of this token, this is used for serialization.
  final String label; // the name of the token, it cannot be uses as an identifier
  final String issuer; // The issuer of this token, currently unused.
  final String id; // this is the identifier of the token
  final bool isLocked;
  final bool pin;
  final String? tokenImage;
  final int? folderId;
  @override
  final int? sortIndex;

  // Must be string representation of TokenType enum.
  final String type; // Used to identify the token when deserializing.

  factory Token.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    if (type.toLowerCase() == enumAsString(TokenTypes.HOTP).toLowerCase()) return HOTPToken.fromJson(json);
    if (type.toLowerCase() == enumAsString(TokenTypes.TOTP).toLowerCase()) return TOTPToken.fromJson(json);
    if (type.toLowerCase() == enumAsString(TokenTypes.PIPUSH).toLowerCase()) return PushToken.fromJson(json);
    if (type.toLowerCase() == enumAsString(TokenTypes.DAYPASSWORD).toLowerCase()) return DayPasswordToken.fromJson(json);
    throw ArgumentError.value(json, 'json', 'Building the token type [$type] is not a supported right now.');
  }
  factory Token.fromUriMap(Map<String, dynamic> uriMap) {
    String type = uriMap[URI_TYPE];
    if (type.toLowerCase() == enumAsString(TokenTypes.HOTP).toLowerCase()) return HOTPToken.fromUriMap(uriMap);
    if (type.toLowerCase() == enumAsString(TokenTypes.TOTP).toLowerCase()) return TOTPToken.fromUriMap(uriMap);
    if (type.toLowerCase() == enumAsString(TokenTypes.PIPUSH).toLowerCase()) return PushToken.fromUriMap(uriMap);
    if (type.toLowerCase() == enumAsString(TokenTypes.DAYPASSWORD).toLowerCase()) return DayPasswordToken.fromUriMap(uriMap);
    throw ArgumentError.value(uriMap, 'uri', 'Building the token type [$type] is not a supported right now.');
  }

  const Token({
    required this.label,
    required this.issuer,
    required this.id,
    required this.type,
    this.tokenImage,
    this.sortIndex,
    this.folderId,
    bool? pin,
    bool? isLocked,
  })  : // when pin is true isLocked is also true otherwise it's the value of isLocked if it is null it's false
        isLocked = pin != null && pin ? true : isLocked ?? false,
        pin = pin ?? false;

  @override
  Token copyWith({
    String? label,
    String? issuer,
    String? id,
    bool? isLocked,
    bool? pin,
    String? tokenImage,
    int? sortIndex,
    int? Function()? folderId,
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
        '_isLocked: $isLocked, '
        'pin: $pin, '
        'tokenImage: $tokenImage, '
        'type: $type, '
        'sortIndex: $sortIndex, '
        'folderId: $folderId';
  }
}
