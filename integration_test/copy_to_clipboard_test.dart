import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:edumfa_authenticator/main.dart';
import 'package:edumfa_authenticator/model/enums/algorithms.dart';
import 'package:edumfa_authenticator/model/enums/introduction.dart';
import 'package:edumfa_authenticator/model/states/introduction_state.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';
import 'package:edumfa_authenticator/model/tokens/hotp_token.dart';
import 'package:edumfa_authenticator/state_notifiers/settings_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/token_folder_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/app_customizer.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/version.dart';

import '../test/tests_app_wrapper.dart';
import '../test/tests_app_wrapper.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late final MockSettingsRepository mockSettingsRepository;
  late final MockTokenRepository mockTokenRepository;
  late final MockTokenFolderRepository mockTokenFolderRepository;
  late final MockIntroductionRepository mockIntroductionRepository;
  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.loadSettings()).thenAnswer((_) async =>
        SettingsState(isFirstRun: false, useSystemLocale: false, localePreference: const Locale('en'), latestVersion: Version.parse('999.999.999')));
    when(mockSettingsRepository.saveSettings(any)).thenAnswer((_) async => true);
    mockTokenRepository = MockTokenRepository();
    when(mockTokenRepository.loadTokens()).thenAnswer((_) async => [
          HOTPToken(label: 'test', issuer: 'test', id: 'id', algorithm: Algorithms.SHA256, digits: 6, secret: 'secret', counter: 0),
        ]);
    when(mockTokenRepository.saveOrReplaceTokens(any)).thenAnswer((_) async => []);
    when(mockTokenRepository.deleteTokens(any)).thenAnswer((_) async => []);
    mockTokenFolderRepository = MockTokenFolderRepository();
    when(mockTokenFolderRepository.loadFolders()).thenAnswer((_) async => []);
    when(mockTokenFolderRepository.saveOrReplaceFolders(any)).thenAnswer((_) async => []);
    mockIntroductionRepository = MockIntroductionRepository();
    final introductions = {...Introduction.values}..remove(Introduction.introductionScreen);
    when(mockIntroductionRepository.loadCompletedIntroductions()).thenAnswer((_) async => IntroductionState(completedIntroductions: introductions));
  });
  testWidgets('Copy to Clipboard Test', (tester) async {
    await tester.pumpWidget(TestsAppWrapper(
      overrides: [
        settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
        tokenProvider.overrideWith((ref) => TokenNotifier(repository: mockTokenRepository)),
        tokenFolderProvider.overrideWith((ref) => TokenFolderNotifier(repository: mockTokenFolderRepository)),
      ],
      child: eduMFAAuthenticator(customization: ApplicationCustomization.defaultCustomization),
    ));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.text('356 306'), 1, const Duration(seconds: 10));
    expect(find.text('356 306'), findsOneWidget);
    await tester.tap(find.text('356 306'));
    await tester.pumpAndSettle();
    expect(find.text('Password "356306" copied to clipboard.'), findsOneWidget);
  }, timeout: const Timeout(Duration(minutes: 5)));
}
