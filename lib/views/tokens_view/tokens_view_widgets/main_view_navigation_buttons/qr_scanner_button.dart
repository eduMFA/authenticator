import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../utils/globals.dart';
import '../../../../utils/riverpod_providers.dart';
import '../../../../utils/view_utils.dart';
import '../../../../widgets/dialog_widgets/default_dialog.dart';
import '../../../qr_scanner_view/qr_scanner_view.dart';

class QrScannerButton extends ConsumerWidget {
  const QrScannerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => FloatingActionButton(
        onPressed: () async {
          if (await Permission.camera.isPermanentlyDenied) {
            showAsyncDialog(
              builder: (_) => DefaultDialog(
                title: Text(S.of(context).grantCameraPermissionDialogTitle),
                content: Text(S.of(context).grantCameraPermissionDialogPermanentlyDenied),
              ),
            );
            return;
          }
          if (globalNavigatorKey.currentContext == null) return;

          /// Open the QR-code scanner and call `handleQrCode`, with the scanned code as the argument.
          Navigator.pushNamed(globalNavigatorKey.currentContext!, QRScannerView.routeName).then((qrCode) {
            if (qrCode != null) ref.read(tokenProvider.notifier).handleQrCode(qrCode);
          });
        },
        tooltip: S.of(context).scanQrCode,
        child: const Icon(Icons.qr_code),
      );
}
