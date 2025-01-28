import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/riverpod_state_listener.dart';
import 'package:edumfa_authenticator/widgets/app_wrappers/state_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edumfa_authenticator/widgets/app_wrappers/single_touch_recognizer.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleTouchRecognizer(
      child: ProviderScope(
        child: StateObserver(
          listeners: [
            NavigationDeepLinkListener(deeplinkProvider: deeplinkProvider),
          ],
          child: EasyDynamicThemeWidget(
            child: child,
          ),
        ),
      ),
    );
  }
}
