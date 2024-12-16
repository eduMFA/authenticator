import 'package:flutter/material.dart';

enum TokenImportType {
  backupFile,
  qrScan,
  qrFile,
  link,
}

extension TokenImportTypeExtension on TokenImportType {
  String get name => toString().split('.').last;
  IconData get icon => switch (this) {
        const (TokenImportType.backupFile) => Icons.file_present,
        const (TokenImportType.qrScan) => Icons.qr_code_scanner,
        const (TokenImportType.qrFile) => Icons.qr_code_2,
        const (TokenImportType.link) => Icons.link,
      };
}
