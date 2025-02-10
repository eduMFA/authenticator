import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:edumfa_authenticator/main.dart';
import 'package:edumfa_authenticator/model/enums/token_types.dart';
import 'package:edumfa_authenticator/state_notifiers/settings_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';

import '../test/tests_app_wrapper.dart';
import '../test/tests_app_wrapper.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late final MockSettingsRepository mockSettingsRepository;
  late final MockTokenRepository mockTokenRepository;
  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.saveSettings(any)).thenAnswer((_) async => true);
    mockTokenRepository = MockTokenRepository();
    when(mockTokenRepository.loadTokens()).thenAnswer((_) async => []);
    when(mockTokenRepository.saveOrReplaceTokens(any)).thenAnswer((_) async => []);
    when(mockTokenRepository.deleteTokens(any)).thenAnswer((_) async => []);
  });
  testWidgets(
    'Add Tokens Test',
    (tester) async {
      await tester.pumpWidget(TestsAppWrapper(
        overrides: [
          settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
          tokenProvider.overrideWith((ref) => TokenNotifier(repository: mockTokenRepository)),
        ],
        child: const EduMFAAuthenticator(),
      ));

      await _introToMainView(tester);
      await _addHotpToken(tester);
      await _addTotpToken(tester);
      await _addDaypasswordToken(tester);
      await tester.pump(const Duration(milliseconds: 200));
    },
    timeout: const Timeout(Duration(minutes: 20)),
  );
}

Future<void> _introToMainView(WidgetTester tester) async {
  var finder = find.byType(FloatingActionButton);
  await pumpUntilFindNWidgets(tester, finder, 1, const Duration(seconds: 20));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 2000));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 2000));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 2000));
  await pumpUntilFindNWidgets(tester, finder, 1, const Duration(seconds: 10));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 1000));
}

Future<void> _addHotpToken(WidgetTester tester) async {
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add_moderator));
  await tester.pump(const Duration(milliseconds: 1000));
  expect(find.byType(TextField), findsNWidgets(2));
  expect(find.text(S.current.addToken), findsOneWidget);
  await tester.tap(find.text(S.current.name));
  await tester.pump();
  await tester.enterText(find.byType(TextField).first, 'test');
  await tester.pump();
  await tester.tap(find.text(S.current.secretKey));
  await tester.pump();
  await tester.enterText(find.byType(TextField).last, 'test');
  await tester.pump();
  await tester.tap(find.text(S.current.addToken));
  await tester.pump(const Duration(milliseconds: 1000));
}

Future<void> _addTotpToken(WidgetTester tester) async {
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add_moderator));
  await tester.pump(const Duration(milliseconds: 1000));
  await tester.tap(find.text(S.current.name));
  await tester.pump();
  await tester.enterText(find.byType(TextField).first, 'test');
  await tester.pump();
  await tester.tap(find.text(S.current.secretKey));
  await tester.pump();
  await tester.enterText(find.byType(TextField).last, 'test');
  await tester.pump();
  await tester.tap(find.byType(DropdownButton<TokenTypes>));
  await tester.pump();
  await tester.tap(find.text('TOTP'));
  await tester.pump();
  expect(find.byType(DropdownButton<int>), findsNWidgets(2));
  await tester.tap(find.text(S.current.addToken));
  await tester.pump(const Duration(milliseconds: 1000));
}

Future<void> _addDaypasswordToken(WidgetTester tester) async {
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add_moderator));
  await tester.pump(const Duration(milliseconds: 1000));
  await tester.enterText(find.byType(TextField).first, 'test');
  await tester.pump();
  await tester.tap(find.text(S.current.secretKey));
  await tester.pump();
  await tester.enterText(find.byType(TextField).last, 'test');
  await tester.pump();
  await tester.tap(find.byType(DropdownButton<TokenTypes>));
  await tester.pump();
  await tester.tap(find.text('DAYPASSWORD'));
  await tester.pump();
  await tester.tap(find.text(S.current.addToken));
  await tester.pump(const Duration(milliseconds: 1000));
}
