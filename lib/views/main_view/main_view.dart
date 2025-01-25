import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/utils/utils.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/widgets/navigation_item.dart';
import 'package:edumfa_authenticator/widgets/push_request_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';

class MainView extends ConsumerStatefulView {
  static const routeName = '/main';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> with LifecycleMixin {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const TokensView(),
    const SettingsView(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    return PushRequestListener(
      child: Scaffold(
        body: isTablet(context)
            ? Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onDestinationSelected,
                    destinations: _getNavigationItems(context)
                        .map((item) => item.toRailDestination()).toList(),
                    labelType: NavigationRailLabelType.all,
                    groupAlignment: 0,
                  ),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.black,
                      child: SafeArea(
                        bottom: false,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                            child: _views[_selectedIndex],
                        ),
                      ),
                    )
                  ),
                ],
            )
            : _views[_selectedIndex],
        bottomNavigationBar: !isTablet(context)
            ? NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: _getNavigationItems(context)
                    .map((item) => item.toDestination()).toList(),
            )
            : null,
      ),
    );
  }

  List<NavigationItem> _getNavigationItems(BuildContext context) => [
    NavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: S.of(context).tokens,
    ),
    NavigationItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      label: S.of(context).settings,
    ),
  ];
}
