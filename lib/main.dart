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
import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/color_scheme_utils.dart';
import 'package:edumfa_authenticator/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/license_view/license_view.dart';
import 'package:edumfa_authenticator/views/main_view/main_view.dart';
import 'package:edumfa_authenticator/views/onboarding_view/onboarding_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:edumfa_authenticator/views/splash_screen/splash_screen.dart';
import 'package:edumfa_authenticator/widgets/app_wrapper.dart';

void main() async {
  Logger.init(
      navigatorKey: globalNavigatorKey,
      appRunner: () async {
        WidgetsFlutterBinding.ensureInitialized();
        runApp(const AppWrapper(child: EduMFAAuthenticator()));
      });
}

class EduMFAAuthenticator extends ConsumerWidget {

  const EduMFAAuthenticator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    globalRef = ref;

    if (!kIsWeb && Platform.isAndroid) {
      var preferredOrientations = <DeviceOrientation>[DeviceOrientation.portraitUp];
      if (isTablet(context)) {
        preferredOrientations.addAll([
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
      SystemChrome.setPreferredOrientations(preferredOrientations);
    }

    return LayoutBuilder(builder: (context, constraints) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appConstraintsProvider.notifier).state = constraints;
      });
      return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ThemeData lightTheme = ThemeData(colorScheme: generateColorScheme(
                lightDynamic?.primary,
                brandColor
            ));
            ThemeData darkTheme = ThemeData(colorScheme: generateColorScheme(
                darkDynamic?.primary,
                brandColor,
                Brightness.dark
            ));

            return MaterialApp(
              debugShowCheckedModeBanner: true,
              navigatorKey: globalNavigatorKey,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: appName,
              theme: lightTheme,
              darkTheme: darkTheme,
              scaffoldMessengerKey: globalSnackbarKey, // <= this
              themeMode: EasyDynamicTheme.of(context).themeMode,
              initialRoute: SplashScreen.routeName,
              routes: {
                LicenseView.routeName: (context) => const LicenseView(),
                MainView.routeName: (context) => const MainView(),
                OnboardingView.routeName: (context) => const OnboardingView(),
                SettingsView.routeName: (context) => const SettingsView(),
                SplashScreen.routeName: (context) => const SplashScreen(),
              },
            );
          }
      );
    });
  }
}
