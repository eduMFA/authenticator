import 'dart:io';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

bool _hasShownMigrationNoticeThisAppRun = false;

Future<void> showMigrationNoticePopup(BuildContext context) async {
  if (_hasShownMigrationNoticeThisAppRun) return;

  final currentRoute = ModalRoute.of(context);
  if (currentRoute?.isCurrent != true) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showMigrationNoticePopup(context),
    );
    return;
  }

  _hasShownMigrationNoticeThisAppRun = true;

  await showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Theme.of(context).colorScheme.scrim.withValues(alpha: 0.72),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const _MigrationNoticeDialog(),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

class _MigrationNoticeDialog extends StatelessWidget {
  const _MigrationNoticeDialog();

  static const _androidStoreUri =
      'https://play.google.com/store/apps/details?id=io.edumfa.app';
  static const _iosStoreUri =
      'itms-apps://itunes.apple.com/app/bundleId/io.edumfa.app';

  Future<void> _openStore() async {
    final storeUri = Uri.parse(
      !kIsWeb && Platform.isIOS ? _iosStoreUri : _androidStoreUri,
    );
    await launchUrl(storeUri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colorScheme.surface,
      child: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 24),
                              SvgPicture.asset(
                                'res/logo/app_image.svg',
                                height: 96,
                                colorFilter: ColorFilter.mode(
                                  colorScheme.onSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Switch to the new eduMFA app',
                                textAlign: TextAlign.center,
                                style: textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'This eduMFA Authenticator app has reached the end of active development. Install the new eduMFA app to continue receiving security updates, compatibility improvements, and new features.',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 16),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: colorScheme.errorContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: colorScheme.onErrorContainer,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'Keep this app installed until all tokens have been migrated. Deleting it too early may remove access to tokens that have not been set up in the new app yet.',
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: colorScheme.onErrorContainer,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'FAQ',
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const _FaqItem(
                                question: 'Can I keep using this app?',
                                answer:
                                    'Yes. Existing tokens continue to work, but this app will no longer receive security updates or new functionality.',
                              ),
                              const _FaqItem(
                                question: 'How do I move to the new app?',
                                answer:
                                    'Install eduMFA, then roll out a new token from your institution portal.',
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: IgnorePointer(
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorScheme.surface.withValues(alpha: 0),
                                    colorScheme.surface,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: colorScheme.surface),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilledButton.icon(
                            onPressed: _openStore,
                            icon: const Icon(Icons.store),
                            label: const Text('Install new app'),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(S.of(context).dismiss),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(bottom: 8),
      title: Text(
        question,
        style: textTheme.titleSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconColor: colorScheme.onSurface,
      collapsedIconColor: colorScheme.onSurface,
      shape: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      collapsedShape: Border(
        bottom: BorderSide(color: colorScheme.outlineVariant),
      ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            answer,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
