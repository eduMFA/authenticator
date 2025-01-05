import 'package:edumfa_authenticator/views/main_view/main_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';
import 'package:flutter/material.dart';

// TODO: Add localization support
enum AppNavigationBarDestination {
  home(Icons.home_outlined, Icons.home_filled, 'Tokens', MainView.routeName),
  settings(Icons.settings_outlined, Icons.settings, 'Settings', SettingsView.routeName);

  const AppNavigationBarDestination(this.icon, this.selectedIcon, this.label, this.routeName);
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String routeName;
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({required this.current, super.key});
  final AppNavigationBarDestination current;

  static List<NavigationDestination> destinations = AppNavigationBarDestination.values
      .map((destination) => NavigationDestination(
    icon: Icon(destination.icon),
    selectedIcon: Icon(destination.selectedIcon),
    label: destination.label,
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        destinations: destinations,
        selectedIndex: AppNavigationBarDestination.values.indexOf(current),
        onDestinationSelected: (index) {
          final newDestination = AppNavigationBarDestination.values[index];
          if (newDestination == current) return;
          // TODO: Improve navigation, hence the current animation isn't that nice
          Navigator.pushReplacementNamed(context, newDestination.routeName);
        },
    );
  }
}



