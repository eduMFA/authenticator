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

  static const defaultCustomization = ApplicationCustomization(
    appName: 'eduMFA Authenticator',
    websiteLink: 'https://edumfa.io/',
  );

  const ApplicationCustomization({
    required this.appName,
    required this.websiteLink,
  });

  ApplicationCustomization copyWith({
    String? appName,
    String? websiteLink,
    Color? primaryColor,
  }) =>
      ApplicationCustomization(
        appName: appName ?? this.appName,
        websiteLink: websiteLink ?? this.websiteLink,
      );

  factory ApplicationCustomization.fromJson(Map<String, dynamic> json) =>
      defaultCustomization.copyWith(
        appName: json['appName'] as String,
        websiteLink: json['websiteLink'] as String,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appName': appName,
      'websiteLink': websiteLink,
    };
  }
}

