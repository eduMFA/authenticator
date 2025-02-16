// Mocks generated by Mockito 5.4.4 from annotations
// in edumfa_authenticator/test/tests_app_wrapper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i15;

import 'package:edumfa_authenticator/interfaces/repo/settings_repository.dart'
    as _i9;
import 'package:edumfa_authenticator/interfaces/repo/token_repository.dart'
    as _i6;
import 'package:edumfa_authenticator/model/states/settings_state.dart' as _i2;
import 'package:edumfa_authenticator/model/tokens/push_token.dart' as _i16;
import 'package:edumfa_authenticator/model/tokens/token.dart' as _i8;
import 'package:edumfa_authenticator/utils/firebase_utils.dart' as _i17;
import 'package:edumfa_authenticator/utils/network_utils.dart' as _i12;
import 'package:edumfa_authenticator/utils/rsa_utils.dart' as _i13;
import 'package:firebase_messaging/firebase_messaging.dart' as _i18;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i14;
import 'package:pointycastle/export.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSettingsState_0 extends _i1.SmartFake implements _i2.SettingsState {
  _FakeSettingsState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRSAPublicKey_2 extends _i1.SmartFake implements _i4.RSAPublicKey {
  _FakeRSAPublicKey_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRSAPrivateKey_3 extends _i1.SmartFake implements _i4.RSAPrivateKey {
  _FakeRSAPrivateKey_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAsymmetricKeyPair_4<B extends _i4.PublicKey,
        V extends _i4.PrivateKey> extends _i1.SmartFake
    implements _i4.AsymmetricKeyPair<B, V> {
  _FakeAsymmetricKeyPair_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TokenRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenRepository extends _i1.Mock implements _i6.TokenRepository {
  @override
  _i7.Future<List<_i8.Token>> saveOrReplaceTokens(List<_i8.Token>? tokens) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveOrReplaceTokens,
          [tokens],
        ),
        returnValue: _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
      ) as _i7.Future<List<_i8.Token>>);

  @override
  _i7.Future<List<_i8.Token>> loadTokens() => (super.noSuchMethod(
        Invocation.method(
          #loadTokens,
          [],
        ),
        returnValue: _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
      ) as _i7.Future<List<_i8.Token>>);

  @override
  _i7.Future<List<_i8.Token>> deleteTokens(List<_i8.Token>? tokens) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTokens,
          [tokens],
        ),
        returnValue: _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.Token>>.value(<_i8.Token>[]),
      ) as _i7.Future<List<_i8.Token>>);
}

/// A class which mocks [SettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsRepository extends _i1.Mock
    implements _i9.SettingsRepository {
  @override
  _i7.Future<bool> saveSettings(_i2.SettingsState? settings) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSettings,
          [settings],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<_i2.SettingsState> loadSettings() => (super.noSuchMethod(
        Invocation.method(
          #loadSettings,
          [],
        ),
        returnValue: _i7.Future<_i2.SettingsState>.value(_FakeSettingsState_0(
          this,
          Invocation.method(
            #loadSettings,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i2.SettingsState>.value(_FakeSettingsState_0(
          this,
          Invocation.method(
            #loadSettings,
            [],
          ),
        )),
      ) as _i7.Future<_i2.SettingsState>);
}

/// A class which mocks [EduMFAIOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockEduMFAIOClient extends _i1.Mock implements _i12.EduMFAIOClient {
  @override
  _i7.Future<bool> triggerNetworkAccessPermission({
    required Uri? url,
    bool? sslVerify = true,
    bool? isRetry = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #triggerNetworkAccessPermission,
          [],
          {
            #url: url,
            #sslVerify: sslVerify,
            #isRetry: isRetry,
          },
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<_i3.Response> doPost({
    required Uri? url,
    required Map<String, String?>? body,
    bool? sslVerify = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #doPost,
          [],
          {
            #url: url,
            #body: body,
            #sslVerify: sslVerify,
          },
        ),
        returnValue: _i7.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #doPost,
            [],
            {
              #url: url,
              #body: body,
              #sslVerify: sslVerify,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #doPost,
            [],
            {
              #url: url,
              #body: body,
              #sslVerify: sslVerify,
            },
          ),
        )),
      ) as _i7.Future<_i3.Response>);

  @override
  _i7.Future<_i3.Response> doGet({
    required Uri? url,
    required Map<String, String?>? parameters,
    bool? sslVerify = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #doGet,
          [],
          {
            #url: url,
            #parameters: parameters,
            #sslVerify: sslVerify,
          },
        ),
        returnValue: _i7.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #doGet,
            [],
            {
              #url: url,
              #parameters: parameters,
              #sslVerify: sslVerify,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #doGet,
            [],
            {
              #url: url,
              #parameters: parameters,
              #sslVerify: sslVerify,
            },
          ),
        )),
      ) as _i7.Future<_i3.Response>);
}

/// A class which mocks [RsaUtils].
///
/// See the documentation for Mockito's code generation for more information.
class MockRsaUtils extends _i1.Mock implements _i13.RsaUtils {
  @override
  _i4.RSAPublicKey deserializeRSAPublicKeyPKCS1(String? keyStr) =>
      (super.noSuchMethod(
        Invocation.method(
          #deserializeRSAPublicKeyPKCS1,
          [keyStr],
        ),
        returnValue: _FakeRSAPublicKey_2(
          this,
          Invocation.method(
            #deserializeRSAPublicKeyPKCS1,
            [keyStr],
          ),
        ),
        returnValueForMissingStub: _FakeRSAPublicKey_2(
          this,
          Invocation.method(
            #deserializeRSAPublicKeyPKCS1,
            [keyStr],
          ),
        ),
      ) as _i4.RSAPublicKey);

  @override
  String serializeRSAPublicKeyPKCS1(_i4.RSAPublicKey? publicKey) =>
      (super.noSuchMethod(
        Invocation.method(
          #serializeRSAPublicKeyPKCS1,
          [publicKey],
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPublicKeyPKCS1,
            [publicKey],
          ),
        ),
        returnValueForMissingStub: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPublicKeyPKCS1,
            [publicKey],
          ),
        ),
      ) as String);

  @override
  _i4.RSAPublicKey deserializeRSAPublicKeyPKCS8(String? keyStr) =>
      (super.noSuchMethod(
        Invocation.method(
          #deserializeRSAPublicKeyPKCS8,
          [keyStr],
        ),
        returnValue: _FakeRSAPublicKey_2(
          this,
          Invocation.method(
            #deserializeRSAPublicKeyPKCS8,
            [keyStr],
          ),
        ),
        returnValueForMissingStub: _FakeRSAPublicKey_2(
          this,
          Invocation.method(
            #deserializeRSAPublicKeyPKCS8,
            [keyStr],
          ),
        ),
      ) as _i4.RSAPublicKey);

  @override
  String serializeRSAPublicKeyPKCS8(_i4.RSAPublicKey? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #serializeRSAPublicKeyPKCS8,
          [key],
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPublicKeyPKCS8,
            [key],
          ),
        ),
        returnValueForMissingStub: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPublicKeyPKCS8,
            [key],
          ),
        ),
      ) as String);

  @override
  String serializeRSAPrivateKeyPKCS1(_i4.RSAPrivateKey? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #serializeRSAPrivateKeyPKCS1,
          [key],
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPrivateKeyPKCS1,
            [key],
          ),
        ),
        returnValueForMissingStub: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #serializeRSAPrivateKeyPKCS1,
            [key],
          ),
        ),
      ) as String);

  @override
  _i4.RSAPrivateKey deserializeRSAPrivateKeyPKCS1(String? keyStr) =>
      (super.noSuchMethod(
        Invocation.method(
          #deserializeRSAPrivateKeyPKCS1,
          [keyStr],
        ),
        returnValue: _FakeRSAPrivateKey_3(
          this,
          Invocation.method(
            #deserializeRSAPrivateKeyPKCS1,
            [keyStr],
          ),
        ),
        returnValueForMissingStub: _FakeRSAPrivateKey_3(
          this,
          Invocation.method(
            #deserializeRSAPrivateKeyPKCS1,
            [keyStr],
          ),
        ),
      ) as _i4.RSAPrivateKey);

  @override
  bool verifyRSASignature(
    _i4.RSAPublicKey? publicKey,
    _i15.Uint8List? signedMessage,
    _i15.Uint8List? signature,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyRSASignature,
          [
            publicKey,
            signedMessage,
            signature,
          ],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i7.Future<String?> trySignWithToken(
    _i16.PushToken? token,
    String? message,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #trySignWithToken,
          [
            token,
            message,
          ],
        ),
        returnValue: _i7.Future<String?>.value(),
        returnValueForMissingStub: _i7.Future<String?>.value(),
      ) as _i7.Future<String?>);

  @override
  _i7.Future<_i4.AsymmetricKeyPair<_i4.RSAPublicKey, _i4.RSAPrivateKey>>
      generateRSAKeyPair() => (super.noSuchMethod(
            Invocation.method(
              #generateRSAKeyPair,
              [],
            ),
            returnValue: _i7.Future<
                    _i4.AsymmetricKeyPair<_i4.RSAPublicKey,
                        _i4.RSAPrivateKey>>.value(
                _FakeAsymmetricKeyPair_4<_i4.RSAPublicKey, _i4.RSAPrivateKey>(
              this,
              Invocation.method(
                #generateRSAKeyPair,
                [],
              ),
            )),
            returnValueForMissingStub: _i7.Future<
                    _i4.AsymmetricKeyPair<_i4.RSAPublicKey,
                        _i4.RSAPrivateKey>>.value(
                _FakeAsymmetricKeyPair_4<_i4.RSAPublicKey, _i4.RSAPrivateKey>(
              this,
              Invocation.method(
                #generateRSAKeyPair,
                [],
              ),
            )),
          ) as _i7.Future<
              _i4.AsymmetricKeyPair<_i4.RSAPublicKey, _i4.RSAPrivateKey>>);

  @override
  String createBase32Signature(
    _i4.RSAPrivateKey? privateKey,
    _i15.Uint8List? dataToSign,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createBase32Signature,
          [
            privateKey,
            dataToSign,
          ],
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #createBase32Signature,
            [
              privateKey,
              dataToSign,
            ],
          ),
        ),
        returnValueForMissingStub: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #createBase32Signature,
            [
              privateKey,
              dataToSign,
            ],
          ),
        ),
      ) as String);

  @override
  _i15.Uint8List createRSASignature(
    _i4.RSAPrivateKey? privateKey,
    _i15.Uint8List? dataToSign,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createRSASignature,
          [
            privateKey,
            dataToSign,
          ],
        ),
        returnValue: _i15.Uint8List(0),
        returnValueForMissingStub: _i15.Uint8List(0),
      ) as _i15.Uint8List);
}

/// A class which mocks [FirebaseUtils].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseUtils extends _i1.Mock implements _i17.FirebaseUtils {
  @override
  _i7.Future<void> initFirebase({
    required _i7.Future<void> Function(_i18.RemoteMessage)? foregroundHandler,
    required _i7.Future<void> Function(_i18.RemoteMessage)? backgroundHandler,
    required dynamic Function(String?)? updateFirebaseToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initFirebase,
          [],
          {
            #foregroundHandler: foregroundHandler,
            #backgroundHandler: backgroundHandler,
            #updateFirebaseToken: updateFirebaseToken,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<String?> getFBToken() => (super.noSuchMethod(
        Invocation.method(
          #getFBToken,
          [],
        ),
        returnValue: _i7.Future<String?>.value(),
        returnValueForMissingStub: _i7.Future<String?>.value(),
      ) as _i7.Future<String?>);
}
