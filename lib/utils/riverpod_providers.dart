import 'dart:ui';

import 'package:app_links/app_links.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/mixins/sortable_mixin.dart';
import '../model/push_request.dart';
import '../model/states/settings_state.dart';
import '../model/states/token_filter.dart';
import '../model/states/token_state.dart';
import '../repo/preference_settings_repository.dart';
import '../state_notifiers/deeplink_notifier.dart';
import '../state_notifiers/push_request_notifier.dart';
import '../state_notifiers/settings_notifier.dart';
import '../state_notifiers/token_notifier.dart';
import 'app_customizer.dart';
import 'globals.dart';
import 'logger.dart';
import 'push_provider.dart';
import 'riverpod_state_listener.dart';

// Never use globalRef to .watch() a provider. only use it to .read() a provider
// Otherwise the whole app will rebuild on every state change of the provider
WidgetRef? globalRef;

final tokenProvider = StateNotifierProvider<TokenNotifier, TokenState>(
  (ref) {
    Logger.info("New TokenNotifier created");
    final newTokenNotifier = TokenNotifier();

    ref.listen(deeplinkProvider, (previous, newLink) {
      if (newLink == null) {
        Logger.info("Received null deeplink", name: 'tokenProvider#deeplinkProvider');
        return;
      }
      Logger.info("Received new deeplink", name: 'tokenProvider#deeplinkProvider');
      newTokenNotifier.handleLink(newLink.uri);
    });

    ref.listen(pushRequestProvider, (previous, newPushRequest) {
      if (newPushRequest == null) {
        Logger.info("Received null pushRequest", name: 'tokenProvider#pushRequestProvider');
        return;
      }
      if (newPushRequest.accepted == null) {
        Logger.info("Received new pushRequest", name: 'tokenProvider#pushRequestProvider');
        newTokenNotifier.addPushRequestToToken(newPushRequest);
      }
      if (newPushRequest.accepted != null) {
        Logger.info("Received pushRequest with accepted=${newPushRequest.accepted}... removing it from state.", name: 'tokenProvider#pushRequestProvider');
        newTokenNotifier.removePushRequest(newPushRequest);
        FlutterLocalNotificationsPlugin().cancelAll();
      }
    });

    ref.listen(
      appStateProvider,
      (previous, next) {
        Logger.info('tokenProvider reviced new AppState. Changed from $previous to $next');
        if (previous == AppLifecycleState.paused && next == AppLifecycleState.resumed) {
          Logger.info('Refreshing tokens on resume', name: 'tokenProvider#appStateProvider');
          newTokenNotifier.loadStateFromRepo();
        }
        if (previous == AppLifecycleState.resumed && next == AppLifecycleState.paused) {
          Logger.info('Saving tokens and cancelling all notifications on pause', name: 'tokenProvider#appStateProvider');
          FlutterLocalNotificationsPlugin().cancelAll();
          newTokenNotifier.saveStateToRepo();
        }
      },
    );
    return newTokenNotifier;
  },
  name: 'tokenProvider',
);

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) {
    // Using Logger here will cause a circular dependency because Logger uses settingsProvider (logging verbosity)
    return SettingsNotifier(repository: PreferenceSettingsRepository());
  },
  name: 'settingsProvider',
);

final pushRequestProvider = StateNotifierProvider<PushRequestNotifier, PushRequest?>(
  (ref) {
    Logger.info("New PushRequestNotifier created", name: 'pushRequestProvider');
    final pushProvider = PushProvider();
    ref.listen(settingsProvider, (previous, next) {
      if (previous?.enablePolling != next.enablePolling) {
        Logger.info("Polling enabled changed from ${previous?.enablePolling} to ${next.enablePolling}", name: 'pushRequestProvider#settingsProvider');
        pushProvider.setPollingEnabled(next.enablePolling);
      }
    });

    final pushRequestNotifier = PushRequestNotifier(
      pushProvider: pushProvider,
    );

    ref.listen(appStateProvider, (previous, next) {
      if (previous == AppLifecycleState.paused && next == AppLifecycleState.resumed) {
        Logger.info('Polling for challenges on resume', name: 'pushRequestProvider#appStateProvider');
        pushProvider.pollForChallenges(isManually: false);
      }
    });

    return pushRequestNotifier;
  },
  name: 'pushRequestProvider',
);

final deeplinkProvider = StateNotifierProvider<DeeplinkNotifier, DeepLink?>(
  (ref) {
    Logger.info("New DeeplinkNotifier created", name: 'deeplinkProvider');
    return DeeplinkNotifier(sources: [
      DeeplinkSource(
          name: 'uni_links',
          stream: AppLinks().uriLinkStream,
          initialUri: Future.value(null)
      ),
    ]);
  },
  name: 'deeplinkProvider',
);

final appStateProvider = StateProvider<AppLifecycleState?>(
  (ref) {
    Logger.info("New AppStateNotifier created", name: 'appStateProvider');
    return null;
  },
  name: 'appStateProvider',
);

final draggingSortableProvider = StateProvider<SortableMixin?>(
  (ref) {
    Logger.info("New draggingSortableProvider created", name: 'draggingSortableProvider');
    return null;
  },
  name: 'draggingSortableProvider',
);

final tokenFilterProvider = StateProvider<TokenFilter?>((ref) => null);

final connectivityProvider = StreamProvider<List<ConnectivityResult>>(
  (ref) {
    Logger.info("New connectivityProvider created", name: 'connectivityProvider');
    ref.read(tokenProvider.notifier).loadingRepo.then(
      (newState) {
        Connectivity().checkConnectivity().then((connectivity) {
          Logger.info("First connectivity check: $connectivity", name: 'connectivityProvider#initialCheck');
          final hasNoConnection = connectivity.contains(ConnectivityResult.none);
          if (hasNoConnection && newState.hasPushTokens && globalNavigatorKey.currentContext != null) {
            ref.read(statusMessageProvider.notifier).state = (S.of(globalNavigatorKey.currentContext!).noNetworkConnection, null);
          }
        });
      },
    );
    return Connectivity().onConnectivityChanged;
  },
);

final statusMessageProvider = StateProvider<(String, String?)?>(
  (ref) {
    Logger.info("New statusMessageProvider created", name: 'statusMessageProvider');
    return null;
  },
);

final appConstraintsProvider = StateProvider<BoxConstraints?>(
  (ref) {
    Logger.info("New constraintsProvider created", name: 'appConstraintsProvider');
    return null;
  },
);

/// Only used for the app customizer
final applicationCustomizerProvider = StateProvider<ApplicationCustomization>((ref) => ApplicationCustomization.defaultCustomization);
