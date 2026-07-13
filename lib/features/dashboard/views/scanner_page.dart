import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Viewfinder (Large Grey Placeholder)
            Positioned(
              top: 60,
              left: 24,
              right: 24,
              bottom: 120,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFAFAFA),
                      Color(0xFFE0E0E0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    // Hard shadow for the 3D depth effect at the bottom edge
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(0, 10),
                      blurRadius: 0,
                    ),
                    // Soft shadow for elevation
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                  child: CustomPaint(
                    size: const Size(80, 80),
                    painter: DashedCirclePainter(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
            ),

            // Top Right Flash Icon
            const Positioned(
              top: 16,
              right: 24,
              child: Icon(
                Icons.flash_off_outlined,
                color: primaryColor,
                size: 28,
              ),
            ),

            // Bottom Dark Gradient
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Controls (Shutter & Gallery)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // Center Shutter Button
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black87,
                        width: 14, // Creates the thick black ring with white center
                      ),
                    ),
                  ),
                  // Right Gallery Button
                  Positioned(
                    right: 40,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.image_outlined,
                        color: Colors.black87,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DashedCirclePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const dashWidth = 8.0;
    const dashSpace = 6.0;
    final circumference = 2 * math.pi * radius;
    final dashCount = (circumference / (dashWidth + dashSpace)).floor();

    final sweepAngle = (dashWidth / circumference) * 2 * math.pi;
    final spaceAngle = (dashSpace / circumference) * 2 * math.pi;

    double currentAngle = 0;
    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        sweepAngle,
        false,
        paint,
      );
      currentAngle += sweepAngle + spaceAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
