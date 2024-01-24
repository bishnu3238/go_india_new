import 'package:flutter/material.dart';
import 'package:go_india_rider/utility/constants/colors.dart';

class WavePainter extends CustomPainter {
  const WavePainter({this.color = kPrimeColor});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(
          0, size.height * 0.7) // Adjust this value to control the wave height
      ..cubicTo(
        size.width * 0.2,
        size.height * 0.5,
        size.width * 0.5,
        size.height * 0.3,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
