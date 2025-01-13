import 'package:flutter/material.dart';

import '../../../../model/tokens/push_token.dart';
import '../../../../model/tokens/token.dart';
import 'push_token_widgets/push_token_widget.dart';
import 'token_widget.dart';

abstract class TokenWidgetBuilder {
  static TokenWidget fromToken(Token token, {Key? key}) => switch (token.runtimeType) {
        const (PushToken) => PushTokenWidget(token as PushToken, key: key),
        _ => throw UnimplementedError('Token type (${token.runtimeType}) not supported in this Version of the App')
      };

}
