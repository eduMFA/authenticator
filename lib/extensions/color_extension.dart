import 'dart:ui';

extension ColorExtension on Color {

  int toInt() {
    final alpha = (a * 255).toInt();
    final red = (r * 255).toInt();
    final green = (g * 255).toInt();
    final blue = (b * 255).toInt();
    // Combine the components into a single int using bit shifting
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
  }

  Color mixWith(Color other) {
    return Color.from(
      alpha: ((a + other.a) / 2).clamp(0.0, 1.0),
      red: ((r + other.r) / 2).clamp(0.0, 1.0),
      green: ((g + other.g) / 2).clamp(0.0, 1.0),
      blue: ((b + other.b) / 2).clamp(0.0, 1.0),
    );
  }
}
