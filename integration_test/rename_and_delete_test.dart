import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:privacyidea_authenticator/main_netknights.dart';
import 'package:privacyidea_authenticator/model/states/settings_state.dart';
import 'package:privacyidea_authenticator/model/tokens/hotp_token.dart';
import 'package:privacyidea_authenticator/state_notifiers/settings_notifier.dart';
import 'package:privacyidea_authenticator/state_notifiers/token_folder_notifier.dart';
import 'package:privacyidea_authenticator/state_notifiers/token_notifier.dart';
import 'package:privacyidea_authenticator/utils/app_customizer.dart';
import 'package:privacyidea_authenticator/utils/identifiers.dart';
import 'package:privacyidea_authenticator/utils/riverpod_providers.dart';
import 'package:privacyidea_authenticator/views/main_view/main_view_widgets/token_widgets/default_token_actions/default_delete_action.dart';
import 'package:privacyidea_authenticator/views/main_view/main_view_widgets/token_widgets/hotp_token_widgets/actions/edit_hotp_token_action.dart';
import 'package:privacyidea_authenticator/views/main_view/main_view_widgets/token_widgets/hotp_token_widgets/hotp_token_widget.dart';

import '../test/tests_app_wrapper.dart';
import '../test/tests_app_wrapper.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late final MockSettingsRepository mockSettingsRepository;
  late final MockTokenRepository mockTokenRepository;
  late final MockTokenFolderRepository mockTokenFolderRepository;
  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.loadSettings()).thenAnswer((_) async => SettingsState(isFirstRun: false));
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
  });
  testWidgets('Rename Token', (tester) async {
    await tester.pumpWidget(TestsAppWrapper(
      overrides: [
        settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
        tokenProvider.overrideWith((ref) => TokenNotifier(repository: mockTokenRepository)),
        tokenFolderProvider.overrideWith((ref) => TokenFolderNotifier(repository: mockTokenFolderRepository)),
      ],
      child: PrivacyIDEAAuthenticator(customization: ApplicationCustomization.defaultCustomization),
    ));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(HOTPTokenWidget), 1, const Duration(seconds: 10));
    expect(find.byType(HOTPTokenWidget), findsOneWidget);
    await tester.drag(find.byType(HOTPTokenWidget), const Offset(-300, 0));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(EditHOTPTokenAction), 1, const Duration(seconds: 2));
    await tester.tap(find.byType(EditHOTPTokenAction));
    await tester.pumpAndSettle();
    expect(find.text('Edit Token'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
    await tester.enterText(find.byType(TextFormField).first, 'Renamed Token');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Renamed Token'), findsOneWidget);
  });
  testWidgets('Rename Token again', (tester) async {
    await tester.pumpWidget(TestsAppWrapper(
      overrides: [
        settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
        tokenProvider.overrideWith((ref) => TokenNotifier(repository: mockTokenRepository)),
        tokenFolderProvider.overrideWith((ref) => TokenFolderNotifier(repository: mockTokenFolderRepository)),
      ],
      child: PrivacyIDEAAuthenticator(customization: ApplicationCustomization.defaultCustomization),
    ));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(HOTPTokenWidget), 1, const Duration(seconds: 10));
    expect(find.byType(HOTPTokenWidget), findsOneWidget);
    await tester.drag(find.byType(HOTPTokenWidget), const Offset(-300, 0));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(EditHOTPTokenAction), 1, const Duration(seconds: 2));
    await tester.tap(find.byType(EditHOTPTokenAction));
    await tester.pumpAndSettle();
    expect(find.text('Edit Token'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
    await tester.enterText(find.byType(TextFormField).first, 'Renamed Token again');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Renamed Token again'), findsOneWidget);
  });
  testWidgets('Delete Token', (tester) async {
    await tester.pumpWidget(TestsAppWrapper(
      overrides: [
        settingsProvider.overrideWith((ref) => SettingsNotifier(repository: mockSettingsRepository)),
        tokenProvider.overrideWith((ref) => TokenNotifier(repository: mockTokenRepository)),
        tokenFolderProvider.overrideWith((ref) => TokenFolderNotifier(repository: mockTokenFolderRepository)),
      ],
      child: PrivacyIDEAAuthenticator(customization: ApplicationCustomization.defaultCustomization),
    ));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(HOTPTokenWidget), 1, const Duration(seconds: 10));
    expect(find.byType(HOTPTokenWidget), findsOneWidget);
    await tester.drag(find.byType(HOTPTokenWidget), const Offset(-300, 0));
    await tester.pumpAndSettle();
    await pumpUntilFindNWidgets(tester, find.byType(EditHOTPTokenAction), 1, const Duration(seconds: 2));
    await tester.tap(find.byType(DefaultDeleteAction));
    await tester.pumpAndSettle();
    expect(find.text('Edit Token'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
    await tester.enterText(find.byType(TextFormField).first, 'Renamed Token');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Renamed Token'), findsOneWidget);
  });
}
