import 'package:edumfa_authenticator/views/main_view/main_view_widgets/token_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:edumfa_authenticator/views/main_view/main_view_widgets/main_view_navigation_buttons/qr_scanner_button.dart';
import 'package:edumfa_authenticator/widgets/global_drawer.dart';

import '../../utils/logger.dart';
import '../../utils/riverpod_providers.dart';
import '../../widgets/push_request_listener.dart';
import '../../widgets/status_bar.dart';
import '../view_interface.dart';
import 'main_view_widgets/connectivity_listener.dart';
import 'main_view_widgets/main_view_tokens_list.dart';
import 'main_view_widgets/main_view_tokens_list_filtered.dart';

export 'package:edumfa_authenticator/views/main_view/main_view.dart';

class MainView extends ConsumerStatefulView {
  static const routeName = '/mainView';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  final String appName;

  const MainView({required this.appName, super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> with LifecycleMixin {
  final globalKey = GlobalKey<NestedScrollViewState>();

  @override
  void onAppResume() {
    Logger.info('MainView Resume', name: 'main_view.dart#onAppResume');
    globalRef?.read(appStateProvider.notifier).state =
        AppLifecycleState.resumed;
  }

  @override
  void onAppPause() {
    Logger.info('MainView Pause', name: 'main_view.dart#onAppPause');
    globalRef?.read(appStateProvider.notifier).state = AppLifecycleState.paused;
  }

  @override
  Widget build(BuildContext context) {
    final hasFilter = ref.watch(tokenFilterProvider) != null;
    return PushRequestListener(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: const QrScannerButton(),
        drawer: const DrawerWidget(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TokenSearchBar(),
            ),
          ),
        ),
        body: ConnectivityListener(
          child: StatusBar(
            child: !hasFilter
                ? Stack(
                    children: [
                      MainViewTokensList(nestedScrollViewKey: globalKey),
                    ],
                  )
                : const MainViewTokensListFiltered(),
          ),
        ),
      ),
    );
  }
}
