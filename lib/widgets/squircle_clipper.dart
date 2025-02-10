import 'package:flutter/widgets.dart';

class SquircleClipper extends CustomClipper<Path> {
  // The factor determines how "squirclish" the shape is.
  // Adjust between 0 (sharp corners) and 0.5 (nearly a circle when square).
  final double factor;

  const SquircleClipper(this.factor);

  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    // Start at the top-left curve.
    path.moveTo(0, height * factor);
    // Top-left curve
    path.cubicTo(0, 0, 0, 0, width * factor, 0);
    // Top edge
    path.lineTo(width - width * factor, 0);
    // Top-right curve
    path.cubicTo(width, 0, width, 0, width, height * factor);
    // Right edge
    path.lineTo(width, height - height * factor);
    // Bottom-right curve
    path.cubicTo(width, height, width, height, width - width * factor, height);
    // Bottom edge
    path.lineTo(width * factor, height);
    // Bottom-left curve
    path.cubicTo(0, height, 0, height, 0, height - height * factor,);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
