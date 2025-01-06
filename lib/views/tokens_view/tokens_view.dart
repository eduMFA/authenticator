import 'package:edumfa_authenticator/model/states/token_filter.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/app_bar_item.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/connectivity_listener.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/expandable_appbar.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/main_view_navigation_buttons/qr_scanner_button.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/tokens_list_filtered.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';

import 'package:edumfa_authenticator/widgets/push_request_listener.dart';
import 'package:edumfa_authenticator/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';

export 'package:edumfa_authenticator/views/main_view/main_view.dart';

class TokensView extends ConsumerStatefulView {
  static const routeName = '/tokens';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const TokensView({super.key});

  @override
  ConsumerState<TokensView> createState() => _TokensViewState();
}

class _TokensViewState extends ConsumerState<TokensView> with LifecycleMixin {
  final globalKey = GlobalKey<NestedScrollViewState>();

  @override
  void onAppResume() {
    Logger.info('TokensView Resume', name: 'tokens_view.dart#onAppResume');
    globalRef?.read(appStateProvider.notifier).state =
        AppLifecycleState.resumed;
  }

  @override
  void onAppPause() {
    Logger.info('TokensView Pause', name: 'tokens_view.dart#onAppPause');
    globalRef?.read(appStateProvider.notifier).state = AppLifecycleState.paused;
  }

  @override
  Widget build(BuildContext context) {
    final hasFilter = ref.watch(tokenFilterProvider) != null;
    return PushRequestListener(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: const QrScannerButton(),
        body: ExpandableAppBar(
          startExpand: hasFilter,
          appBar: AppBar(
              titleSpacing: 6,
              centerTitle: true,
              actions: [
                hasFilter
                    ? AppBarItem(
                  onPressed: () {
                    ref.read(tokenFilterProvider.notifier).state = null;
                  },
                  icon: const Icon(Icons.close),
                )
                    : AppBarItem(
                  onPressed: () {
                    ref.read(tokenFilterProvider.notifier).state =
                        TokenFilter(
                          searchQuery: '',
                        );
                  },
                  icon: const Icon(Icons.search),
                ),
              ]),
          body: ConnectivityListener(
            child: StatusBar(
              child: !hasFilter
                  ? Stack(
                children: [
                  TokensList(nestedScrollViewKey: globalKey),
                ],
              )
                  : const TokensListFiltered(),
            ),
          ),
        ),
      ),
    );
  }
}
