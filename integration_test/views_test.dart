import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:edumfa_authenticator/main.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';
import 'package:edumfa_authenticator/state_notifiers/settings_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/rsa_utils.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view_widgets/settings_groups.dart';
import 'package:version/version.dart';

import '../test/tests_app_wrapper.dart';
import '../test/tests_app_wrapper.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late final MockSettingsRepository mockSettingsRepository;
  late final MockTokenRepository mockTokenRepository;
  late final MockRsaUtils mockRsaUtils;
  late final MockFirebaseUtils mockFirebaseUtils;
  late final MockEduMFAIOClient mockIOClient;
  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.loadSettings()).thenAnswer((_) async =>
        SettingsState(isFirstRun: false, latestVersion: Version(999, 999, 999)));
    when(mockSettingsRepository.saveSettings(any)).thenAnswer((_) async => true);
    mockTokenRepository = MockTokenRepository();
    when(mockTokenRepository.loadTokens()).thenAnswer((_) async => []);
    when(mockTokenRepository.saveOrReplaceTokens(any)).thenAnswer((_) async => []);
    when(mockTokenRepository.deleteTokens(any)).thenAnswer((_) async => []);
    mockRsaUtils = MockRsaUtils();
    when(mockRsaUtils.serializeRSAPublicKeyPKCS8(any)).thenAnswer((_) => 'publicKey');
    when(mockRsaUtils.generateRSAKeyPair()).thenAnswer((_) => const RsaUtils()
        .generateRSAKeyPair()); // We get here a random result anyway and is it more likely to make errors by mocking it than by using the real method
    mockFirebaseUtils = MockFirebaseUtils();
    when(mockFirebaseUtils.getFBToken()).thenAnswer((_) => Future.value('fbToken'));
    when(mockRsaUtils.deserializeRSAPublicKeyPKCS1('publicKey')).thenAnswer((_) => RSAPublicKey(BigInt.one, BigInt.one));
    mockIOClient = MockEduMFAIOClient();
    when(mockIOClient.doPost(
      url: anyNamed('url'),
      body: anyNamed('body'),
      sslVerify: anyNamed('sslVerify'),
    )).thenAnswer((_) => Future.value(Response('{"detail": {"public_key": "publicKey"}}', 200)));
  });

  testWidgets('Views Test', (tester) async {
    await tester.pumpWidget(TestsAppWrapper(
      overrides: [
        settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
        tokenProvider.overrideWith((ref) => TokenNotifier(
              repository: mockTokenRepository,
              rsaUtils: mockRsaUtils,
              firebaseUtils: mockFirebaseUtils,
              ioClient: mockIOClient,
            )),
      ],
      child: const EduMFAAuthenticator(),
    ));

    await _licensesViewTest(tester);
    await _popUntilMainView(tester);
    await _settingsViewTest(tester);
  }, timeout: const Timeout(Duration(minutes: 10)));
}

Future<void> _popUntilMainView(WidgetTester tester) async {
  await pumpUntilFindNWidgets(tester, find.byIcon(Icons.arrow_back), 1, const Duration(seconds: 2));
  while (find.byIcon(Icons.arrow_back).evaluate().isNotEmpty) {
    await tester.tap(find.byIcon(Icons.arrow_back));
    await pumpUntilFindNWidgets(tester, find.byIcon(Icons.arrow_back), 1, const Duration(seconds: 2));
  }
  return;
}

Future<void> _licensesViewTest(WidgetTester tester) async {
  await pumpUntilFindNWidgets(tester, find.byIcon(Icons.info_outline), 1, const Duration(seconds: 20));
  await tester.tap(find.byIcon(Icons.info_outline));
  await tester.pumpAndSettle();
  expect(find.text(appName), findsOneWidget);
  expect(find.text(websiteUri.toString()), findsOneWidget);
  expect(find.byType(Icon), findsOneWidget);
  expect(find.byType(LicensePage), findsOneWidget);
}

Future<void> _settingsViewTest(WidgetTester tester) async {
  await pumpUntilFindNWidgets(tester, find.byIcon(Icons.settings), 1, const Duration(seconds: 10));
  await tester.tap(find.byIcon(Icons.settings));
  await tester.pumpAndSettle();
  expect(find.text(S.current.settings), findsOneWidget);
  expect(find.text(S.current.theme), findsOneWidget);
  expect(find.byType(SettingsGroup), findsNWidgets(5));
  globalRef!.read(tokenProvider.notifier).handleQrCodeUri(
    Uri(
        scheme: 'edumfa-push',
        host: 'edumfa',
        path: 'label',
        queryParameters: {
          'url': 'https://example.com',
          'ttl': "10",
          'issuer': 'issuer',
          'enrollment_credential': 'enrollmentCredentials',
          'v': "1",
          'serial': 'serial',
          'sslverify': "0"
        }
    ).toString()
  );
  await pumpUntilFindNWidgets(tester, find.text(S.current.pushToken), 1, const Duration(minutes: 5));
  expect(find.text(S.current.pushToken), findsOneWidget);
  expect(find.byType(SettingsGroup), findsNWidgets(5));
}
