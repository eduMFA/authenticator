import 'dart:ui';

import 'package:app_links/app_links.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edumfa_authenticator/model/push_request.dart';
import 'package:edumfa_authenticator/model/states/settings_state.dart';
import 'package:edumfa_authenticator/model/states/token_filter.dart';
import 'package:edumfa_authenticator/model/states/token_state.dart';
import 'package:edumfa_authenticator/repo/preference_settings_repository.dart';
import 'package:edumfa_authenticator/state_notifiers/deeplink_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/push_request_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/settings_notifier.dart';
import 'package:edumfa_authenticator/state_notifiers/token_notifier.dart';
import 'package:edumfa_authenticator/utils/globals.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_state_listener.dart';

// Never use globalRef to .watch() a provider. only use it to .read() a provider
// Otherwise the whole app will rebuild on every state change of the provider
WidgetRef? globalRef;

final tokenProvider = NotifierProvider<TokenNotifier, TokenState>(
  () => TokenNotifier(attachProviderListeners: true),
  name: 'tokenProvider',
);

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(
  // Using Logger here will cause a circular dependency because Logger uses settingsProvider (logging verbosity)
  () => SettingsNotifier(repository: PreferenceSettingsRepository()),
  name: 'settingsProvider',
);

final pushRequestProvider = NotifierProvider<PushRequestNotifier, PushRequest?>(
  () => PushRequestNotifier(attachProviderListeners: true),
  name: 'pushRequestProvider',
);

final deeplinkProvider = NotifierProvider<DeeplinkNotifier, DeepLink?>(
  () => DeeplinkNotifier(
    sources: [
      DeeplinkSource(
          name: 'uni_links',
          stream: AppLinks().uriLinkStream,
          initialUri: Future.value(null)
      ),
    ],
  ),
  name: 'deeplinkProvider',
);

final appStateProvider = NotifierProvider<AppStateNotifier, AppLifecycleState?>(
  AppStateNotifier.new,
  name: 'appStateProvider',
);

final tokenFilterProvider = NotifierProvider<TokenFilterNotifier, TokenFilter?>(TokenFilterNotifier.new);

final connectivityProvider = StreamProvider<List<ConnectivityResult>>(
  (ref) {
    Logger.info("New connectivityProvider created", name: 'connectivityProvider');
    ref.read(tokenProvider.notifier).loadingRepo.then(
      (newState) {
        Connectivity().checkConnectivity().then((connectivity) {
          Logger.info("First connectivity check: $connectivity", name: 'connectivityProvider#initialCheck');
          final hasNoConnection = connectivity.contains(ConnectivityResult.none);
          if (hasNoConnection && newState.hasPushTokens && globalNavigatorKey.currentContext != null) {
            ref.read(statusMessageProvider.notifier).setMessage(S.of(globalNavigatorKey.currentContext!).noNetworkConnection, null);
          }
        });
      },
    );
    return Connectivity().onConnectivityChanged;
  },
);

final statusMessageProvider = NotifierProvider<StatusMessageNotifier, (String, String?)?>(
  StatusMessageNotifier.new,
);

final appConstraintsProvider = NotifierProvider<AppConstraintsNotifier, BoxConstraints?>(
  AppConstraintsNotifier.new,
);

class AppStateNotifier extends Notifier<AppLifecycleState?> {
  @override
  AppLifecycleState? build() {
    Logger.info("New AppStateNotifier created", name: 'appStateProvider');
    return null;
  }

  void setState(AppLifecycleState? value) => state = value;
}

class TokenFilterNotifier extends Notifier<TokenFilter?> {
  @override
  TokenFilter? build() => null;

  void setFilter(TokenFilter? value) => state = value;
}

class StatusMessageNotifier extends Notifier<(String, String?)?> {
  @override
  (String, String?)? build() {
    Logger.info("New statusMessageProvider created", name: 'statusMessageProvider');
    return null;
  }

  void setMessage(String message, String? details) => state = (message, details);

  void clear() => state = null;
}

class AppConstraintsNotifier extends Notifier<BoxConstraints?> {
  @override
  BoxConstraints? build() {
    Logger.info("New constraintsProvider created", name: 'appConstraintsProvider');
    return null;
  }

  void setConstraints(BoxConstraints value) => state = value;
}
