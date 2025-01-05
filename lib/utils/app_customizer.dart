import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ApplicationCustomization {
  // Edit in android/app/src/main/AndroidManifest.xml file
  // <application android:label="app name">

  // Edit in ios/Runner/Info.plist file
  // <key>CFBundleName</key>
  // <string>app name</string>
  // <string>app name</string>

  // CHANGE PACKAGE NAME
  // Type in terminal
  // flutter pub run change_app_package_name:main new.package.name

  // CHANGE LAUNCHER ICONS
  // Edit in pubspec.yaml file
  // flutter_icons:
  // android: true
  // ios: true
  // image_path: appIcon as string

  // ----- CHANGE GOOGLE-SERVICES -----
  // Insert the new google-services.json with the package name of the new app
  // 1. Android: google-services.json is the file name
  // - /android/app/src/debug (add ".debug" to package_name)
  // - /android/app/src/release
  // 2. iOS: in /ios/ add the GoogleService-Info.plist

  final String appName;
  final String websiteLink;
  final Uint8List? appImageUint8List;

  Image get appImage => appImageUint8List != null
      ? Image.memory(appImageUint8List!)
      : Image.asset('res/logo/app_logo_transparent.png');

  static const defaultCustomization = ApplicationCustomization(
    appName: 'eduMFA Authenticator',
    websiteLink: 'https://edumfa.io/',
    appImageUint8List: null,
  );

  const ApplicationCustomization({
    required this.appName,
    required this.websiteLink,
    required this.appImageUint8List,
  });

  ApplicationCustomization copyWith({
    String? appName,
    String? websiteLink,
    Uint8List? appIconUint8List,
    Uint8List? appImageUint8List,
    Color? primaryColor,
  }) =>
      ApplicationCustomization(
        appName: appName ?? this.appName,
        websiteLink: websiteLink ?? this.websiteLink,
        appImageUint8List: appImageUint8List ?? this.appImageUint8List,
      );

  factory ApplicationCustomization.fromJson(Map<String, dynamic> json) =>
      defaultCustomization.copyWith(
        appName: json['appName'] as String,
        websiteLink: json['websiteLink'] as String,
        appImageUint8List: json['appImageBASE64'] != null
            ? base64Decode(json['appImageBASE64'] as String)
            : null,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appName': appName,
      'websiteLink': websiteLink,
      'appImageBASE64': appImageUint8List != null ? base64Encode(appImageUint8List!) : null,
    };
  }
}

