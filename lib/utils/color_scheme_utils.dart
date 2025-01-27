import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// The Dynamic Color package doesn't initialize new ColorScheme roles.
// This causes some issues with some colors being off. This method combines
// a solution for this issues, but also handling for devices that doesn't
// support dynamic colors. GitHub issue:
// https://github.com/material-foundation/flutter-packages/issues/582
ColorScheme generateColorScheme(Color? primaryColor, Color fallbackColor, [Brightness? brightness]) {
  final Color seedColor = primaryColor ?? fallbackColor;
  final ColorScheme newScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: brightness ?? Brightness.light,
  );
  return newScheme.harmonized();
}