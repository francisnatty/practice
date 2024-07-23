import 'package:flutter/material.dart';
import 'package:practice/animations/utils/app_colors.dart';

class RipplePainter extends CustomPainter {
  final double radius;
  final double? strokeWidth;

  RipplePainter(this.radius, {this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? 5;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
