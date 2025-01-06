import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view.dart';
import 'package:edumfa_authenticator/views/view_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerStatefulView {
  static const routeName = '/main';

  @override
  RouteSettings get routeSettings => const RouteSettings(name: routeName);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TokensView(),
    SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Tokens',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
