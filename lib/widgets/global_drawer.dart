import 'package:edumfa_authenticator/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:edumfa_authenticator/views/main_view/main_view.dart';
import 'package:edumfa_authenticator/views/settings_view/settings_view.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            const SizedBox(
                height: 200,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(
                                "launcher_icons/edumfa/ic_launcher_adaptive.png"),
                            fit: BoxFit.cover)),
                    child: Text('eduMFA Authenticator',
                        style: TextStyle(color: Colors.white, fontSize: 24)))),
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                children: [
                  ListTile(
                    leading: const Icon(Icons.key),
                    title: Text(AppLocalizations.of(context)!.tokens),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, MainView.routeName);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.settings),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SettingsView.routeName);
                    },
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
