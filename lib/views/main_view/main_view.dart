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
import 'package:haptic_feedback/haptic_feedback.dart';
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
  late final List<Widget> _views;
  int _selectedIndex = 0;

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
                    leading: SizedBox(
                      height: 56,  // 56 is the default for FAB
                      child: _selectedIndex == 0
                          ? FloatingActionButton(
                              tooltip: S.of(context).addToken,
                              child: const Icon(Icons.add),
                              onPressed: () async => await _tokensViewKey.currentState!.showAddTokenSheet(_tokensViewKey.currentContext!)
                          ) : null,
                    ),
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

  Future<void> _onDestinationSelected(int index) async {
    await Haptics.vibrate(HapticsType.selection);
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
}
