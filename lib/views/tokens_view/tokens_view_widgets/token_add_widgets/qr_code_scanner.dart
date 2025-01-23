import 'package:edumfa_authenticator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QrCodeScannerWidget extends StatelessWidget {
  final MobileScannerController controller;

  const QrCodeScannerWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 300,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(16),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: MobileScanner(
        controller: controller,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).cameraPermissionPermanentlyDenied,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => openAppSettings(),
                    child: Text(S.of(context).cameraPermissionPermanentlyDeniedButton),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}