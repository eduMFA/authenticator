import 'dart:ui';

extension ColorExtension on Color {
  Color mixWith(Color other) {
    return Color.from(
      alpha: ((a + other.a) / 2).clamp(0.0, 1.0),
      red: ((r + other.r) / 2).clamp(0.0, 1.0),
      green: ((g + other.g) / 2).clamp(0.0, 1.0),
      blue: ((b + other.b) / 2).clamp(0.0, 1.0),
    );
  }
}
