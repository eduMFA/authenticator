import 'dart:async';

import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:edumfa_authenticator/utils/riverpod_providers.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_add_widgets/qr_code_scanner.dart';
import 'package:edumfa_authenticator/views/tokens_view/tokens_view_widgets/token_add_widgets/upload_qr_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AddTokenSheetWidget extends ConsumerStatefulWidget {
  const AddTokenSheetWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTokenSheetWidgetState();
}

class _AddTokenSheetWidgetState extends ConsumerState<AddTokenSheetWidget> {
  final MobileScannerController controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
  );

  StreamSubscription<Object?>? _subscription;

  void _handleBarcode(BarcodeCapture? barcodes) {
    if (!mounted) return;
    _subscription?.cancel();
    Navigator.pop(context);
    ref.read(tokenProvider.notifier).handleQrCodeUri(barcodes?.barcodes.firstOrNull?.rawValue);
  }

  @override
  void initState() {
    super.initState();
    _subscription = controller.barcodes.listen(_handleBarcode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 0),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).addTokenTitle,
              style: TextTheme.of(context).headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).addTokenSubtitle,
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            QrCodeScannerWidget(controller: controller),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: ColorScheme.of(context).outlineVariant,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    S.of(context).or,
                    style: TextTheme.of(context).labelLarge?.copyWith(
                      color: ColorScheme.of(context).outline,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: ColorScheme.of(context).outlineVariant,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            UploadQrCodeButton(controller: controller, handleBarcodes: _handleBarcode),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }
}