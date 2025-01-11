import 'package:edumfa_authenticator/l10n/app_localizations.dart';
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
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error),
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.cameraPermissionPermanentlyDenied,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => openAppSettings(),
                    child: Text(AppLocalizations.of(context)!.cameraPermissionPermanentlyDeniedButton),
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