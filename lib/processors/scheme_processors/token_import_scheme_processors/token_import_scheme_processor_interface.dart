import 'package:edumfa_authenticator/model/tokens/token.dart';
import 'package:edumfa_authenticator/processors/scheme_processors/scheme_processor_interface.dart';
import 'package:edumfa_authenticator/processors/scheme_processors/token_import_scheme_processors/otp_auth_processor.dart';

abstract class TokenImportSchemeProcessor implements SchemeProcessor {
  const TokenImportSchemeProcessor();
  static const Set<TokenImportSchemeProcessor> implementations = {
    OtpAuthProcessor(),
  };

  @override
  Future<List<Token>> processUri(Uri uri, {bool fromInit = false});

  static Future<List<Token>?> processUriByAny(Uri uri) async {
    for (TokenImportSchemeProcessor processor in implementations) {
      if (processor.supportedSchemes.contains(uri.scheme)) {
        return await processor.processUri(uri);
      }
    }
    return null;
  }
}
