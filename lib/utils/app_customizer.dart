import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ThemeCustomization {
  static const ThemeCustomization defaultLightTheme =
      ThemeCustomization.defaultLightWith();
  static const ThemeCustomization defaultDarkTheme =
      ThemeCustomization.defaultDarkWith();

  const ThemeCustomization({
    required this.brightness,
    required this.primaryColor,
    required this.onPrimary,
    required this.subtitleColor,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.shadowColor,
    required this.deleteColor,
    required this.renameColor,
    required this.lockColor,
    required this.tileIconColor,
    required this.navigationBarColor,
    Color? actionButtonsForegroundColor,
    Color? tilePrimaryColor,
    Color? tileSubtitleColor,
    Color? navigationBarIconColor,
    Color? qrButtonBackgroundColor,
    Color? qrButtonIconColor,
  })  : _actionButtonsForegroundColor = actionButtonsForegroundColor,
        _tilePrimaryColor = tilePrimaryColor,
        _tileSubtitleColor = tileSubtitleColor,
        _navigationBarIconColor = navigationBarIconColor,
        _qrButtonBackgroundColor = qrButtonBackgroundColor,
        _qrButtonIconColor = qrButtonIconColor;

  const ThemeCustomization.defaultLightWith({
    Color? primaryColor,
    Color? onPrimary,
    Color? subtitleColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? shadowColor,
    Color? deleteColor,
    Color? renameColor,
    Color? lockColor,
    Color? tileIconColor,
    Color? navigationBarColor,
    // From here on the colors have a default value based on another given color
    Color? actionButtonsForegroundColor, // Default: foregroundColor
    Color? tilePrimaryColor, // Default: primaryColor
    Color? tileSubtitleColor, // Default: subtitleColor
    Color? navigationBarIconColor, // Default: foregroundColor
    Color? qrButtonBackgroundColor, // Default: primaryColor
    Color? qrButtonIconColor, // Default: onPrimary
  })  : brightness = Brightness.light,
        primaryColor = primaryColor ?? Colors.lightBlue,
        onPrimary = onPrimary ?? const Color(0xff282828),
        subtitleColor = subtitleColor ?? const Color(0xff9E9E9E),
        backgroundColor = backgroundColor ?? const Color(0xffEFEFEF),
        foregroundColor = foregroundColor ?? const Color(0xff282828),
        shadowColor = shadowColor ?? const Color(0xff303030),
        deleteColor = deleteColor ?? const Color(0xffE04D2D),
        renameColor = renameColor ?? const Color(0xff6A8FE5),
        lockColor = lockColor ?? const Color(0xffFFD633),
        tileIconColor = tileIconColor ?? const Color(0xff757575),
        navigationBarColor = navigationBarColor ?? Colors.white,
        // From here on the colors have a default value based on another given color
        _actionButtonsForegroundColor = actionButtonsForegroundColor,
        _tilePrimaryColor = tilePrimaryColor,
        _tileSubtitleColor = tileSubtitleColor,
        _navigationBarIconColor = navigationBarIconColor,
        _qrButtonBackgroundColor = qrButtonBackgroundColor,
        _qrButtonIconColor = qrButtonIconColor;

  const ThemeCustomization.defaultDarkWith({
    Color? primaryColor,
    Color? onPrimary,
    Color? subtitleColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? shadowColor,
    Color? deleteColor,
    Color? renameColor,
    Color? lockColor,
    Color? tileIconColor,
    Color? navigationBarColor,
    // From here on the colors have a default value based on another given color
    Color? actionButtonsForegroundColor, // Default: foregroundColor
    Color? tilePrimaryColor, // Default: primaryColor
    Color? tileSubtitleColor, // Default: subtitleColor
    Color? navigationBarIconColor, // Default: foregroundColor
    Color? qrButtonBackgroundColor, // Default: primaryColor
    Color? qrButtonIconColor, // Default: onPrimary
  })  : brightness = Brightness.dark,
        primaryColor = primaryColor ?? Colors.lightBlue,
        onPrimary = onPrimary ?? const Color(0xFF282828),
        subtitleColor = subtitleColor ?? const Color(0xFF9E9E9E),
        backgroundColor = backgroundColor ?? const Color(0xFF303030),
        foregroundColor = foregroundColor ?? const Color(0xffF5F5F5),
        shadowColor = shadowColor ?? const Color(0xff303030),
        deleteColor = deleteColor ?? const Color(0xffCD3C14),
        renameColor = renameColor ?? const Color(0xff527EDB),
        lockColor = lockColor ?? const Color(0xffFFCC00),
        tileIconColor = tileIconColor ?? const Color(0xffF5F5F5),
        navigationBarColor = navigationBarColor ?? const Color(0xFF282828),
        // From here on the colors have a default value based on another given color
        _actionButtonsForegroundColor = actionButtonsForegroundColor,
        _tilePrimaryColor = tilePrimaryColor,
        _tileSubtitleColor = tileSubtitleColor,
        _navigationBarIconColor = navigationBarIconColor,
        _qrButtonBackgroundColor = qrButtonBackgroundColor,
        _qrButtonIconColor = qrButtonIconColor;

  final Brightness brightness;

  // Basic colors
  final Color primaryColor;
  final Color onPrimary;
  final Color subtitleColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color shadowColor;

  // Slide action
  final Color deleteColor;
  final Color renameColor;
  final Color lockColor;
  final Color? _actionButtonsForegroundColor; // Default: foregroundColor
  Color get actionButtonsForegroundColor =>
      _actionButtonsForegroundColor ?? foregroundColor;

  // List tile
  final Color? _tilePrimaryColor; // Default: primaryColor
  Color get tilePrimaryColor => _tilePrimaryColor ?? primaryColor;
  final Color tileIconColor;
  final Color? _tileSubtitleColor; // Default: subtitleColor
  Color get tileSubtitleColor => _tileSubtitleColor ?? subtitleColor;

  // Navigation bar
  final Color navigationBarColor;
  final Color? _navigationBarIconColor; // Default: foregroundColor
  Color get navigationBarIconColor =>
      _navigationBarIconColor ?? foregroundColor;
  final Color? _qrButtonBackgroundColor; // Default: primaryColor
  Color get qrButtonBackgroundColor => _qrButtonBackgroundColor ?? primaryColor;
  final Color? _qrButtonIconColor; // Default: onPrimary
  Color get qrButtonIconColor => _qrButtonIconColor ?? onPrimary;

  ThemeCustomization copyWith({
    Brightness? brightness,
    Color? primaryColor,
    Color? onPrimary,
    Color? subtitleColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? shadowColor,
    Color? deleteColor,
    Color? renameColor,
    Color? lockColor,
    Color? tileIconColor,
    Color? navigationBarColor,
    // From here on the colors have a default value based on another given color
    Color? Function()? actionButtonsForegroundColor, // Default: foregroundColor
    Color? Function()? tilePrimaryColor, // Default: primaryColor
    Color? Function()? tileSubtitleColor, // Default: subtitleColor
    Color? Function()? navigationBarIconColor, // Default: foregroundColor
    Color? Function()? qrButtonBackgroundColor, // Default: primaryColor
    Color? Function()? qrButtonIconColor, // Default: onPrimary
  }) =>
      ThemeCustomization(
        brightness: brightness ?? this.brightness,
        primaryColor: primaryColor ?? this.primaryColor,
        onPrimary: onPrimary ?? this.onPrimary,
        subtitleColor: subtitleColor ?? this.subtitleColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        foregroundColor: foregroundColor ?? this.foregroundColor,
        shadowColor: shadowColor ?? this.shadowColor,
        deleteColor: deleteColor ?? this.deleteColor,
        renameColor: renameColor ?? this.renameColor,
        lockColor: lockColor ?? this.lockColor,
        actionButtonsForegroundColor: actionButtonsForegroundColor != null
            ? actionButtonsForegroundColor()
            : this.actionButtonsForegroundColor,
        tilePrimaryColor: tilePrimaryColor != null
            ? tilePrimaryColor()
            : this.tilePrimaryColor,
        tileIconColor: tileIconColor ?? this.tileIconColor,
        tileSubtitleColor: tileSubtitleColor != null
            ? tileSubtitleColor()
            : this.tileSubtitleColor,
        navigationBarColor: navigationBarColor ?? this.navigationBarColor,
        navigationBarIconColor: navigationBarIconColor != null
            ? navigationBarIconColor()
            : this.navigationBarIconColor,
        qrButtonBackgroundColor: qrButtonBackgroundColor != null
            ? qrButtonBackgroundColor()
            : this.qrButtonBackgroundColor,
        qrButtonIconColor: qrButtonIconColor != null
            ? qrButtonIconColor()
            : this.qrButtonIconColor,
      );

  factory ThemeCustomization.fromJson(Map<String, dynamic> json) {
    bool isLightTheme = json['brightness'] == 'light';
    bool isDarkTheme = json['brightness'] == 'dark';
    if (json['brightness'] == null && json['primaryColor'] != null) {
      isLightTheme = _isColorBright(Color(json['primaryColor'] as int));
    }
    if (isLightTheme) {
      return ThemeCustomization.defaultLightWith(
        primaryColor: json['primaryColor'] != null
            ? Color(json['primaryColor'] as int)
            : null,
        onPrimary:
            json['onPrimary'] != null ? Color(json['onPrimary'] as int) : null,
        subtitleColor: json['subtitleColor'] != null
            ? Color(json['subtitleColor'] as int)
            : null,
        backgroundColor: json['backgroundColor'] != null
            ? Color(json['backgroundColor'] as int)
            : null,
        foregroundColor: json['foregroundColor'] != null
            ? Color(json['foregroundColor'] as int)
            : null,
        shadowColor: json['shadowColor'] != null
            ? Color(json['shadowColor'] as int)
            : null,
        deleteColor: json['deleteColor'] != null
            ? Color(json['deleteColor'] as int)
            : null,
        renameColor: json['renameColor'] != null
            ? Color(json['renameColor'] as int)
            : null,
        lockColor:
            json['lockColor'] != null ? Color(json['lockColor'] as int) : null,
        actionButtonsForegroundColor:
            json['actionButtonsForegroundColor'] != null
                ? Color(json['actionButtonsForegroundColor'] as int)
                : null,
        tilePrimaryColor: json['tilePrimaryColor'] != null
            ? Color(json['tilePrimaryColor'] as int)
            : null,
        tileIconColor: json['tileIconColor'] != null
            ? Color(json['tileIconColor'] as int)
            : null,
        tileSubtitleColor: json['tileSubtitleColor'] != null
            ? Color(json['tileSubtitleColor'] as int)
            : null,
        navigationBarColor: json['navigationBarColor'] != null
            ? Color(json['navigationBarColor'] as int)
            : null,
        navigationBarIconColor: json['navigationBarIconColor'] != null
            ? Color(json['navigationBarIconColor'] as int)
            : null,
        qrButtonBackgroundColor: json['qrButtonBackgroundColor'] != null
            ? Color(json['qrButtonBackgroundColor'] as int)
            : null,
        qrButtonIconColor: json['qrButtonIconColor'] != null
            ? Color(json['qrButtonIconColor'] as int)
            : null,
      );
    }
    if (isDarkTheme) {
      return ThemeCustomization.defaultDarkWith(
        primaryColor: json['primaryColor'] != null
            ? Color(json['primaryColor'] as int)
            : null,
        onPrimary:
            json['onPrimary'] != null ? Color(json['onPrimary'] as int) : null,
        subtitleColor: json['subtitleColor'] != null
            ? Color(json['subtitleColor'] as int)
            : null,
        backgroundColor: json['backgroundColor'] != null
            ? Color(json['backgroundColor'] as int)
            : null,
        foregroundColor: json['foregroundColor'] != null
            ? Color(json['foregroundColor'] as int)
            : null,
        shadowColor: json['shadowColor'] != null
            ? Color(json['shadowColor'] as int)
            : null,
        deleteColor: json['deleteColor'] != null
            ? Color(json['deleteColor'] as int)
            : null,
        renameColor: json['renameColor'] != null
            ? Color(json['renameColor'] as int)
            : null,
        lockColor:
            json['lockColor'] != null ? Color(json['lockColor'] as int) : null,
        actionButtonsForegroundColor:
            json['actionButtonsForegroundColor'] != null
                ? Color(json['actionButtonsForegroundColor'] as int)
                : null,
        tilePrimaryColor: json['tilePrimaryColor'] != null
            ? Color(json['tilePrimaryColor'] as int)
            : null,
        tileIconColor: json['tileIconColor'] != null
            ? Color(json['tileIconColor'] as int)
            : null,
        tileSubtitleColor: json['tileSubtitleColor'] != null
            ? Color(json['tileSubtitleColor'] as int)
            : null,
        navigationBarColor: json['navigationBarColor'] != null
            ? Color(json['navigationBarColor'] as int)
            : null,
        navigationBarIconColor: json['navigationBarIconColor'] != null
            ? Color(json['navigationBarIconColor'] as int)
            : null,
        qrButtonBackgroundColor: json['qrButtonBackgroundColor'] != null
            ? Color(json['qrButtonBackgroundColor'] as int)
            : null,
        qrButtonIconColor: json['qrButtonIconColor'] != null
            ? Color(json['qrButtonIconColor'] as int)
            : null,
      );
    }
    throw Exception('Invalid brightness value: ${json['brightness']}');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'brightness': brightness == Brightness.light ? 'light' : 'dark',
        'primaryColor': primaryColor.value,
        'onPrimary': onPrimary.value,
        'subtitleColor': subtitleColor.value,
        'backgroundColor': backgroundColor.value,
        'foregroundColor': foregroundColor.value,
        'shadowColor': shadowColor.value,
        'deleteColor': deleteColor.value,
        'renameColor': renameColor.value,
        'lockColor': lockColor.value,
        'tileIconColor': tileIconColor.value,
        'navigationBarColor': navigationBarColor.value,
        '_actionButtonsForegroundColor': _actionButtonsForegroundColor?.value,
        '_tilePrimaryColor': _tilePrimaryColor?.value,
        '_tileSubtitleColor': _tileSubtitleColor?.value,
        '_navigationBarIconColor': _navigationBarIconColor?.value,
        '_qrButtonBackgroundColor': _qrButtonBackgroundColor?.value,
      };

  ThemeData generateTheme() => ThemeData(
          useMaterial3: false,
          brightness: brightness,
          primaryColor: primaryColor,
          canvasColor: backgroundColor,
          textTheme: const TextTheme().copyWith(
            bodyLarge: TextStyle(color: foregroundColor),
            bodyMedium: TextStyle(color: foregroundColor),
            titleMedium: TextStyle(color: foregroundColor),
            titleSmall: TextStyle(color: foregroundColor),
            displayLarge: TextStyle(color: foregroundColor),
            displayMedium: TextStyle(color: foregroundColor),
            displaySmall: TextStyle(color: foregroundColor),
            headlineMedium: TextStyle(color: foregroundColor),
            headlineSmall: TextStyle(color: foregroundColor),
            titleLarge: TextStyle(color: primaryColor),
            bodySmall: TextStyle(color: subtitleColor),
            labelLarge: TextStyle(color: foregroundColor),
            labelSmall: TextStyle(color: foregroundColor),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(foregroundColor),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: onPrimary,
              backgroundColor: primaryColor,
              padding: const EdgeInsets.all(6),
              shadowColor: shadowColor,
              elevation: 1.5,
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
          cardColor: backgroundColor,
          shadowColor: shadowColor,
          // shadowColor: Colors.transparent,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: backgroundColor,
            shadowColor: shadowColor,
            foregroundColor: foregroundColor,
            elevation: 0,
            titleSpacing: 6,
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: foregroundColor),
            hintStyle: TextStyle(color: primaryColor),
            errorStyle: TextStyle(color: deleteColor),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: shadowColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: subtitleColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          primaryIconTheme: IconThemeData(color: onPrimary),
          iconTheme: IconThemeData(color: foregroundColor),
          navigationBarTheme: const NavigationBarThemeData().copyWith(
            backgroundColor: navigationBarColor,
            shadowColor: shadowColor,
            iconTheme: WidgetStatePropertyAll(
                IconThemeData(color: navigationBarIconColor)),
            elevation: 3,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: qrButtonBackgroundColor,
            foregroundColor: qrButtonIconColor,
            elevation: 0,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateColor.resolveWith(
                  (states) => foregroundColor.withAlpha((0.1 * 255).round())),
            ),
          ),
          listTileTheme: ListTileThemeData(
            tileColor: Colors.transparent,
            titleTextStyle: TextStyle(color: tilePrimaryColor),
            subtitleTextStyle: TextStyle(color: tileSubtitleColor),
            iconColor: tileIconColor,
          ),
          colorScheme: brightness == Brightness.light
              ? ColorScheme.light(
                  primary: primaryColor,
                  secondary: primaryColor,
                  onPrimary: onPrimary,
                  onSecondary: onPrimary,
                  error: deleteColor,
                  errorContainer: deleteColor,
                )
              : ColorScheme.dark(
                  primary: primaryColor,
                  secondary: primaryColor,
                  onPrimary: onPrimary,
                  onSecondary: onPrimary,
                  error: deleteColor,
                  errorContainer: deleteColor,
                ),
          checkboxTheme: CheckboxThemeData(
            checkColor:
                WidgetStateProperty.resolveWith<Color?>((_) => onPrimary),
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            }),
          ),
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            }),
          ),
          switchTheme: SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            }),
            trackColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return null;
            }),
          ),
          extensions: [
            ActionTheme(
              deleteColor: deleteColor,
              editColor: renameColor,
              lockColor: lockColor,
              foregroundColor: actionButtonsForegroundColor,
            ),
            ExtendedTextTheme(
              tokenTile: TextStyle(
                color: primaryColor,
              ),
              tokenTileSubtitle: TextStyle(
                color: tileSubtitleColor,
              ),
            ),
          ]);
}

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

  // Terminal
  // flutter pub run flutter_launcher_icons:main

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
  final ThemeCustomization lightTheme;
  final ThemeCustomization darkTheme;

  static const defaultCustomization = ApplicationCustomization(
    appName: 'eduMFA Authenticator',
    websiteLink: 'https://edumfa.io/',
    appImageUint8List: null,
    lightTheme: ThemeCustomization.defaultLightTheme,
    darkTheme: ThemeCustomization.defaultDarkTheme,
  );

  const ApplicationCustomization({
    required this.appName,
    required this.websiteLink,
    required this.appImageUint8List,
    required this.lightTheme,
    required this.darkTheme,
  });

  ApplicationCustomization copyWith({
    String? appName,
    String? websiteLink,
    Uint8List? appIconUint8List,
    Uint8List? appImageUint8List,
    ThemeCustomization? lightTheme,
    ThemeCustomization? darkTheme,
    Color? primaryColor,
  }) =>
      ApplicationCustomization(
        appName: appName ?? this.appName,
        websiteLink: websiteLink ?? this.websiteLink,
        appImageUint8List: appImageUint8List ?? this.appImageUint8List,
        lightTheme: lightTheme ?? this.lightTheme,
        darkTheme: darkTheme ?? this.darkTheme,
      );

  ThemeData generateLightTheme() => lightTheme.generateTheme();

  ThemeData generateDarkTheme() => darkTheme.generateTheme();

  factory ApplicationCustomization.fromJson(Map<String, dynamic> json) =>
      defaultCustomization.copyWith(
        appName: json['appName'] as String,
        websiteLink: json['websiteLink'] as String,
        appImageUint8List: json['appImageBASE64'] != null
            ? base64Decode(json['appImageBASE64'] as String)
            : null,
        lightTheme: ThemeCustomization.fromJson(
            json['lightTheme'] as Map<String, dynamic>),
        darkTheme: ThemeCustomization.fromJson(
            json['darkTheme'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appName': appName,
      'websiteLink': websiteLink,
      'appImageBASE64': appImageUint8List != null ? base64Encode(appImageUint8List!) : null,
      'lightTheme': lightTheme.toJson(),
      'darkTheme': darkTheme.toJson(),
    };
  }
}

class ExtendedTextTheme extends ThemeExtension<ExtendedTextTheme> {
  final TextStyle tokenTile;
  final TextStyle tokenTileSubtitle;
  final String veilingCharacter;

  ExtendedTextTheme({
    this.veilingCharacter = '●',
    TextStyle? tokenTile,
    TextStyle? tokenTileSubtitle,
  })  : tokenTile = const TextStyle(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
        ).merge(tokenTile),
        tokenTileSubtitle = const TextStyle(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
        ).merge(tokenTileSubtitle);

  @override
  ThemeExtension<ExtendedTextTheme> copyWith({
    TextStyle? otpTextStyle,
    TextStyle? otpSubtitleTextStyle,
  }) =>
      ExtendedTextTheme(
        tokenTile: otpTextStyle ?? tokenTile,
        tokenTileSubtitle: otpSubtitleTextStyle ?? tokenTileSubtitle,
      );

  @override
  ThemeExtension<ExtendedTextTheme> lerp(ExtendedTextTheme? other, double t) =>
      ExtendedTextTheme(
        tokenTile: TextStyle.lerp(tokenTile, other?.tokenTile, t) ?? tokenTile,
      );
}

class ActionTheme extends ThemeExtension<ActionTheme> {
  final Color deleteColor;
  final Color editColor;
  final Color lockColor;
  final Color foregroundColor;

  const ActionTheme({
    required this.deleteColor,
    required this.editColor,
    required this.lockColor,
    required this.foregroundColor,
  });

  @override
  ThemeExtension<ActionTheme> lerp(covariant ActionTheme? other, double t) =>
      ActionTheme(
        deleteColor:
            Color.lerp(deleteColor, other?.deleteColor, t) ?? deleteColor,
        editColor: Color.lerp(editColor, other?.editColor, t) ?? editColor,
        lockColor: Color.lerp(lockColor, other?.lockColor, t) ?? lockColor,
        foregroundColor:
            Color.lerp(foregroundColor, other?.foregroundColor, t) ??
                foregroundColor,
      );

  @override
  ThemeExtension<ActionTheme> copyWith(
          {Color? deleteColor,
          Color? editColor,
          Color? lockColor,
          Color? foregroundColor}) =>
      ActionTheme(
        deleteColor: deleteColor ?? this.deleteColor,
        editColor: editColor ?? this.editColor,
        lockColor: lockColor ?? this.lockColor,
        foregroundColor: foregroundColor ?? this.foregroundColor,
      );
}

// /// Calculate HSP and check if the primary color is bright or dark
// /// brightness  =  sqrt( .299 R^2 + .587 G^2 + .114 B^2 )
// /// c.f., http://alienryderflex.com/hsp.html
bool _isColorBright(Color color) {
  return sqrt(0.299 * pow(color.red, 2) +
          0.587 * pow(color.green, 2) +
          0.114 * pow(color.blue, 2)) >
      150;
}

