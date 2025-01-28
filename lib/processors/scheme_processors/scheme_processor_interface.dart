import 'package:edumfa_authenticator/processors/scheme_processors/token_import_scheme_processors/token_import_scheme_processor_interface.dart';

abstract class SchemeProcessor {
  const SchemeProcessor();
  Set<String> get supportedSchemes;
  Future<dynamic> processUri(Uri uri, {bool fromInit = false});

  static final List<SchemeProcessor> implementations = [
    ...TokenImportSchemeProcessor.implementations,
  ];
  static Future<dynamic> processUriByAny(Uri uri, {bool fromInit = false}) async {
    for (SchemeProcessor processor in implementations) {
      if (processor.supportedSchemes.contains(uri.scheme)) {
        return await processor.processUri(uri);
      }
    }
    return null;
  }
}
