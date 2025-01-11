/*
  This file is part of eduMFA Authenticator. eduMFA Authenticator is a fork of privacyIDEA Authenticator.
  Copyright (c) 2024 eduMFA Project-Team

  Previous authors by privacyIDEA project:
  Timo Sturm <timo.sturm@netknights.it>
  Frank Merkel <frank.merkel@netknights.it>

  Copyright (c) 2017-2023 NetKnights GmbH

  Licensed under the Apache License, Version 2.0 (the 'License');
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an 'AS IS' BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edumfa_authenticator/l10n/app_localizations.dart';
import 'package:edumfa_authenticator/utils/app_customizer.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/license_view/license_view.dart';
import 'package:edumfa_authenticator/views/main_view/main_view.dart';
import 'package:edumfa_authenticator/views/onboarding_view/onboarding_view.dart';
import 'package:edumfa_authenticator/views/push_token_view/push_tokens_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:edumfa_authenticator/views/splash_screen/splash_screen.dart';
import 'package:edumfa_authenticator/widgets/app_wrapper.dart';

import 'views/feedback_view/feedback_view.dart';

void main() async {
  Logger.init(
      navigatorKey: globalNavigatorKey,
      appRunner: () async {
        WidgetsFlutterBinding.ensureInitialized();
        runApp(AppWrapper(child: EduMFAAuthenticator(customization: ApplicationCustomization.defaultCustomization)));
      });
}

class EduMFAAuthenticator extends ConsumerWidget {
  static ApplicationCustomization? currentCustomization;
  final ApplicationCustomization _customization;
  EduMFAAuthenticator({required ApplicationCustomization customization, super.key}) : _customization = customization {
    // ignore: prefer_initializing_formals
    EduMFAAuthenticator.currentCustomization = customization;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    globalRef = ref;
    final locale = ref.watch(settingsProvider).currentLocale;
    return LayoutBuilder(builder: (context, constraints) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appConstraintsProvider.notifier).state = constraints;
      });
      return MaterialApp(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: const ClampingScrollPhysics(),
          overscroll: false,
        ),
        debugShowCheckedModeBanner: true,
        navigatorKey: globalNavigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        title: _customization.appName,
        theme: _customization.generateLightTheme(),
        darkTheme: _customization.generateDarkTheme(),
        scaffoldMessengerKey: globalSnackbarKey, // <= this
        themeMode: EasyDynamicTheme.of(context).themeMode,
        initialRoute: SplashScreen.routeName,
        routes: {
          FeedbackView.routeName: (context) => const FeedbackView(),
          LicenseView.routeName: (context) => LicenseView(
                appImage: _customization.appImage,
                appName: _customization.appName,
                websiteLink: _customization.websiteLink,
              ),
          MainView.routeName: (context) => MainView(
                appName: _customization.appName,
              ),
          OnboardingView.routeName: (context) => OnboardingView(
                appName: _customization.appName,
              ),
          PushTokensView.routeName: (context) => const PushTokensView(),
          SettingsView.routeName: (context) => const SettingsView(),
          SplashScreen.routeName: (context) => SplashScreen(
                appImage: _customization.appImage,
                appName: _customization.appName,
              ),
        },
      );
    });
  }
}
