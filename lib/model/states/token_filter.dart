import 'package:edumfa_authenticator/model/tokens/push_token.dart';
import 'package:edumfa_authenticator/model/tokens/token.dart';

class TokenFilter {
  String searchQuery;
  TokenFilter({required this.searchQuery});
  List<Token> filterTokens(List<Token> tokens) {
    final filteredTokens = <Token>[];
    final regExp = RegExp(RegExp.escape(searchQuery), caseSensitive: false);
    for (final token in tokens) {
      if (regExp.hasMatch(token.label) || regExp.hasMatch(token.issuer) || token is PushToken && regExp.hasMatch(token.serial) || regExp.hasMatch(token.type)) {
        filteredTokens.add(token);
      }
    }
    return filteredTokens;
  }
}
