import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

typedef HandleBarcodeCallback = void Function(BarcodeCapture? barcodes);

class UploadQrCodeButton extends StatelessWidget {
  final MobileScannerController controller;
  final HandleBarcodeCallback handleBarcodes;

  const UploadQrCodeButton({required this.controller, required this.handleBarcodes, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: PlatformElevatedButton(
      material: (_, platform) => MaterialElevatedButtonData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () async {
        final XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (image == null) return;

        final BarcodeCapture? barcodes = await controller.analyzeImage(
            image.path, formats: [BarcodeFormat.qrCode]
        );
        handleBarcodes(barcodes);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.0,
        children: [
          PlatformWidget(
            material: (_, __) => const Icon(Icons.upload_file),
            cupertino: (_, __) => const Icon(CupertinoIcons.arrow_up_doc),
          ),
          Text(S.of(context).uploadQrCodeButton)
        ],
      ),

    ),
  );
}