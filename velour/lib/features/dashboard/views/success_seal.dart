import 'package:flutter/material.dart';
import 'dart:math' as math;

class SuccessSeal extends StatelessWidget {
  final double size;
  final Color color;

  const SuccessSeal({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: SealPainter(color: color),
    );
  }
}

class SealPainter extends CustomPainter {
  final Color color;

  SealPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.85; 

    final path = Path();
    for (int i = 0; i <= 360; i++) {
      final rad = (i - 90) * math.pi / 180; // Start at top (-90 degrees)
      
      // A smooth 8-point star/wave using cosine function
      final r = innerRadius + (outerRadius - innerRadius) * (math.cos(rad * 8) + 1) / 2;
      
      final x = center.dx + r * math.cos(rad);
      final y = center.dy + r * math.sin(rad);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Fill the seal
    final fillPaint = Paint()
      ..color = color.withOpacity(0.2) // Light orange fill
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Outline the seal (slightly thicker)
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8 // Slightly thicker as requested
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, strokePaint);

    // Draw the rounded checkmark
    final w = size.width;
    final checkPath = Path();
    checkPath.moveTo(center.dx - w * 0.16, center.dy + w * 0.015);
    checkPath.lineTo(center.dx - w * 0.04, center.dy + w * 0.13);
    checkPath.lineTo(center.dx + w * 0.19, center.dy - w * 0.11);

    final checkPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    
    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
