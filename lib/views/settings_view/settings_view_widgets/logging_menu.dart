import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/riverpod_providers.dart';
import '../../../widgets/dialog_widgets/default_dialog.dart';
import 'errorlog_buttons/delete_errorlog_button.dart';
import 'errorlog_buttons/send_errorlog_button.dart';
import 'errorlog_buttons/show_errorlog_button.dart';

class LoggingMenu extends ConsumerWidget {
  const LoggingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final verboseLogging = settings.verboseLogging;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultDialog(
        scrollable: true,
        title: Text(
          S.of(context).logMenu,
          style: Theme.of(context).listTileTheme.titleTextStyle,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                S.of(context).verboseLogging,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              contentPadding: const EdgeInsets.all(0),
              trailing: Switch(value: verboseLogging, onChanged: (value) => ref.read(settingsProvider.notifier).setVerboseLogging(value)),
              style: ListTileStyle.list,
              onTap: () => ref.read(settingsProvider.notifier).toggleVerboseLogging(),
            ),
            const Divider(),
            const ShowErrorLogButton(),
            const DeleteErrorlogButton(),
            const SendErrorLogButton(),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              S.of(context).dismiss,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
