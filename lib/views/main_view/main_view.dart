import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/logger.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:edumfa_authenticator/widgets/push_request_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlifecyclehooks/flutterlifecyclehooks.dart';
import 'package:quick_actions/quick_actions.dart';

class MainView extends ConsumerStatefulView {
  static const routeName = '/main';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> with LifecycleMixin {
  final _tokensViewKey = GlobalKey<TokensViewState>();
  int _selectedIndex = 0;
  late final List<Widget> _views;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _registerQuickActions() {
    const quickActions = QuickActions();
    quickActions.initialize((String type) {
      if (type != 'add_token') return;
      if (_selectedIndex != 0) {
        setState(() {
          _selectedIndex = 0;
        });
      }
      Navigator.of(context).popUntil((route) => route.isFirst);
      Future.delayed(const Duration(seconds: 1), () {
        if (_tokensViewKey.currentState == null || _tokensViewKey.currentContext == null) return;
        if (!ModalRoute.of(_tokensViewKey.currentContext!)!.isCurrent) return;
        _tokensViewKey.currentState!.showAddTokenSheet(_tokensViewKey.currentContext!);
      });
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(type: 'add_token', localizedTitle: S.of(context).addToken, icon: 'add_icon'),
    ]);
  }

  @override
  void initState() {
    _views = [
      TokensView(key: _tokensViewKey),
      const SettingsView(),
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registerQuickActions();
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
        body: _views[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: S.of(context).tokens,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: S.of(context).settings,
            ),
          ],
        ),
      ),
    );
  }
}
