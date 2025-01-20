import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
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
    child: FilledButton.icon(
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
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(Icons.upload_file),
      label: Text(S.of(context).uploadQrCodeButton),
    ),
  );
}