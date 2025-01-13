import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/states/token_state.dart';
import '../processors/scheme_processors/navigation_scheme_processors/navigation_scheme_processor_interface.dart';
import '../state_notifiers/deeplink_notifier.dart';
import '../state_notifiers/token_notifier.dart';

abstract class StateNotifierProviderListener<T extends StateNotifier<S>, S> {
  final StateNotifierProvider<T, S> provider;
  final void Function(S? previous, S next) onNewState;
  const StateNotifierProviderListener({required this.provider, required this.onNewState});
  void buildListen(WidgetRef ref) {
    ref.listen(provider, onNewState);
  }
}

abstract class DeepLinkListener extends StateNotifierProviderListener<DeeplinkNotifier, DeepLink?> {
  const DeepLinkListener({
    required StateNotifierProvider<DeeplinkNotifier, DeepLink?> deeplinkProvider,
    required super.onNewState,
  }) : super(provider: deeplinkProvider);
}

class NavigationDeepLinkListener extends DeepLinkListener {
  static BuildContext? _context;
  NavigationDeepLinkListener({required super.deeplinkProvider, BuildContext? context})
      : super(
          onNewState: (DeepLink? previous, DeepLink? next) {
            _onNewState(previous, next);
          },
        ) {
    _context = context;
  }

  static void _onNewState(DeepLink? previous, DeepLink? next) {
    if (next == null) return;
    NavigationSchemeProcessor.processUriByAny(next.uri, context: _context, fromInit: next.fromInit);
  }
}

abstract class TokenStateListener extends StateNotifierProviderListener<TokenNotifier, TokenState> {
  const TokenStateListener({
    required StateNotifierProvider<TokenNotifier, TokenState> tokenProvider,
    required super.onNewState,
  }) : super(provider: tokenProvider);
}

class DeepLink {
  final Uri uri;
  final bool fromInit;
  const DeepLink(this.uri, {this.fromInit = false});
}
