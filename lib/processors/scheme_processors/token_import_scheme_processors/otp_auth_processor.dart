import 'dart:typed_data';

import '../../../model/enums/algorithms.dart';
import '../../../model/enums/encodings.dart';
import '../../../model/enums/token_types.dart';
import '../../../model/extensions/enum_extension.dart';
import '../../../model/tokens/token.dart';
import '../../../utils/crypto_utils.dart';
import '../../../utils/identifiers.dart';
import '../../../utils/logger.dart';
import '../../../utils/supported_versions.dart';
import '../../../utils/view_utils.dart';
import '../../../widgets/dialog_widgets/two_step_dialog.dart';
import 'token_import_scheme_processor_interface.dart';

class OtpAuthProcessor extends TokenImportSchemeProcessor {
  const OtpAuthProcessor();
  @override
  Set<String> get supportedSchemes => {'edumfa-push'};

  @override
  Future<List<Token>> processUri(Uri uri, {bool fromInit = false}) async {
    if (!supportedSchemes.contains(uri.scheme)) return [];
    Logger.info('Try to handle otpAuth:', name: 'token_notifier.dart#addTokenFromOtpAuth');
    Map<String, dynamic> uriMap;
    try {
      uriMap = _parseEduMFAPushToken(uri);
    } on ArgumentError catch (e, s) {
      // Error while parsing qr code.
      Logger.warning('Malformed QR code:', name: 'token_notifier.dart#_handleOtpAuth', error: e, stackTrace: s);
      //showMessage(message: '${e.message}\n Please inform the creator of this qr code about the problem.', duration: const Duration(seconds: 8));

      return [];
    }
    if (_is2StepURI(uri)) {
      validateMap(uriMap, [URI_SECRET, URI_ITERATIONS, URI_OUTPUT_LENGTH_IN_BYTES, URI_SALT_LENGTH]);
      final secret = uriMap[URI_SECRET] as Uint8List;
      // Calculate the whole secret.
      Uint8List? twoStepSecret;
      while (twoStepSecret == null) {
        twoStepSecret = (await showAsyncDialog<Uint8List>(
          barrierDismissible: false,
          builder: (context) => GenerateTwoStepDialog(
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
      return [];
    }
    return [newToken];
  }
}

Map<String, dynamic> _parseEduMFAPushToken(Uri uri) {
  // otpauth://pipush/LABELTEXT?
  // url=https://edumfa.io/enroll/this/token
  // &ttl=120
  // &issuer=eduMFA
  // &enrollment_credential=9311ee50678983c0f29d3d843f86e39405e2b427
  // &v=1
  // &serial=PIPU0006EF87
  // &sslverify=1

  Map<String, dynamic> uriMap = {};

  uriMap[URI_TYPE] = "EDUMFA_PUSH";

  // If we do not support the version of this piauth url, we can stop here.
  String? pushVersionAsString = uri.queryParameters['v'];

  if (pushVersionAsString == null) {
    throw ArgumentError.value(uri, 'uri', 'Parameter [v] is not an optional parameter and is missing.');
  }

  try {
    int pushVersion = int.parse(pushVersionAsString);

    Logger.info('Parsing push token with version: $pushVersion', name: 'parsing_utils.dart#parseEduMFAPushToken');

    if (pushVersion > maxPushTokenVersion) {
      throw ArgumentError.value(
        'Unsupported version: $pushVersion',
        'QrParser#parseEduMFAPushToken',
        'The piauth version [$pushVersionAsString] is not supported by this version of the app.',
      );
    }
  } on FormatException {
    throw ArgumentError.value(
      'Invalid version: $pushVersionAsString',
      'QrParser#parseEduMFAPushToken',
      '[$pushVersionAsString] is not a valid value for parameter [v].',
    );
  }

  if (uri.queryParameters['image'] != null) {
    uriMap[URI_IMAGE] = uri.queryParameters['image'];
  }

  final (label, issuer) = _parseLabelAndIssuer(uri);
  uriMap[URI_LABEL] = label;
  uriMap[URI_ISSUER] = issuer;
  uriMap[URI_SERIAL] = uri.queryParameters['serial'];
  ArgumentError.checkNotNull(uriMap[URI_SERIAL], 'serial');

  String? url = uri.queryParameters['url'];
  ArgumentError.checkNotNull(url, 'url');
  try {
    uriMap[URI_ROLLOUT_URL] = Uri.parse(url!);
  } on FormatException {
    throw ArgumentError.value(uri, 'uri', '[$url] is not a valid Uri.');
  }

  String ttlAsString = uri.queryParameters['ttl'] ?? '10';
  try {
    uriMap[URI_TTL] = int.parse(ttlAsString);
  } on FormatException {
    throw ArgumentError.value('Invalid ttl: $ttlAsString', 'QrParser#_parsePiAuth', '[$ttlAsString] is not a valid value for parameter [ttl].');
  }

  uriMap[URI_ENROLLMENT_CREDENTIAL] = uri.queryParameters['enrollment_credential'];
  ArgumentError.checkNotNull(uriMap[URI_ENROLLMENT_CREDENTIAL], 'enrollment_credential');

  uriMap[URI_SSL_VERIFY] = (uri.queryParameters['sslverify'] ?? '1') == '1';

  // parse pin from response 'True'
  if (uri.queryParameters['pin'] == 'True') {
    uriMap[URI_PIN] = true;
  }

  return uriMap;
}

/// Parse the label and the issuer (if it exists) from the url.
(String, String) _parseLabelAndIssuer(Uri uri) {
  String label = '';
  String issuer = '';
  String param = uri.path.substring(1);
  param = Uri.decodeFull(param);

  try {
    if (param.contains(':')) {
      List split = param.split(':');
      issuer = split[0];
      label = split[1];
    } else {
      label = param;
      issuer = _parseIssuer(uri);
    }
  } on Error {
    label = param;
  }

  return (label, issuer);
}

String _parseIssuer(Uri uri) {
  String? issuer;
  String? param = uri.queryParameters['issuer'];

  try {
    issuer = Uri.decodeFull(param!);
  } on Error {
    issuer = param;
  }

  return issuer ?? '';
}

bool _is2StepURI(Uri uri) {
  return uri.queryParameters['2step_salt'] != null || uri.queryParameters['2step_output'] != null || uri.queryParameters['2step_difficulty'] != null;
}
