import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/logger.dart';
import '../../../utils/riverpod_providers.dart';

class ConnectivityListener extends ConsumerWidget {
  final Widget child;
  const ConnectivityListener({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityProvider).asData?.value;
    if (connectivity != null && connectivity.contains(ConnectivityResult.none)) {
      ref.read(tokenProvider.notifier).loadingRepo.then((newState) {
        if (newState.hasPushTokens) {
          if (!context.mounted) return;
          Logger.info("Connectivity changed: $connectivity");
          ref.read(statusMessageProvider.notifier).state = (S.of(context).noNetworkConnection, null);
        }
      });
    }
    return child;
  }
}
