import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edumfa_authenticator/utils/riverpod_state_listener.dart';

class StateObserver extends ConsumerWidget {
  final List<StateNotifierProviderListener> listeners;
  final Widget child;

  const StateObserver({super.key, required this.listeners, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    for (final listener in listeners) {
      listener.buildListen(ref);
    }
    return child;
  }
}
