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

  Color opposite() {
    return Color.from(
      alpha: a,
      red: 1.0 - (r.toDouble() / 255.0),
      green: 1.0 - (g.toDouble() / 255.0),
      blue: 1.0 - (b.toDouble() / 255.0),
    );
  }
}
