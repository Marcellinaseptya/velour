import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class TrackingAddressView extends StatelessWidget {
  const TrackingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8), // Base color for the map
      body: Stack(
        children: [
          // 1. Map Mockup Background & Route
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;

                final p1 = Offset(w * 0.18, h * 0.48); // Origin
                final p2 = Offset(w * 0.38, h * 0.28); // Truck
                final p3 = Offset(w * 0.8, h * 0.14);  // Home

                return Stack(
                  children: [
                    CustomPaint(
                      size: Size(w, h),
                      painter: MapRoutePainter(p1, p2, p3),
                    ),
                    // Markers
                    Positioned(
                      left: p1.dx - 10,
                      top: p1.dy - 10,
                      child: _buildOriginMarker(),
                    ),
                    Positioned(
                      left: p2.dx - 18,
                      top: p2.dy - 18,
                      child: _buildIconMarker(Icons.local_shipping, primaryColor),
                    ),
                    Positioned(
                      left: p3.dx - 18,
                      top: p3.dy - 18,
                      child: _buildIconMarker(Icons.home, primaryColor),
                    ),
                  ],
                );
              },
            ),
          ),

          // 2. Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 24,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
                onPressed: () => Get.back(),
              ),
            ),
          ),

          // 3. Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.52,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  // Segmented Control
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.offNamed('/tracking-detail'),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Order Tracking',
                                  style: GoogleFonts.inter(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Tracking Address',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Info Texts
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tracking ID',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '#ABC02-DEFC45X',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Current Location',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.grey[700], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              'Jalanan Caatur, Yogyakarta',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Timeline
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      children: [
                        _buildTimelineItem(
                          title: 'The order has arrived at\nits destination',
                          subtitle: 'Received by Casey kaspol',
                          date: 'January 11, 2025',
                          isLast: false,
                        ),
                        _buildTimelineItem(
                          title: 'The order from jl.\njalanan Yogyakarta',
                          subtitle: 'Received by Casey kaspol',
                          date: 'January 11, 2025',
                          isLast: true,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOriginMarker() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFE660C), width: 4),
      ),
    );
  }

  Widget _buildIconMarker(IconData icon, Color iconColor) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Icon(icon, color: iconColor, size: 18),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String date,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFE660C), width: 1.5),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFE660C),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 1.5,
                height: 48, // slightly longer height for two lines of text
                color: const Color(0xFFFE660C).withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Received by ',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      subtitle.replaceFirst('Received by ', ''), // If subtitle includes prefix
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            date,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}

class MapRoutePainter extends CustomPainter {
  final Offset p1;
  final Offset p2;
  final Offset p3;

  MapRoutePainter(this.p1, this.p2, this.p3);

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw Simulated City Blocks
    final gridPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
      
    final blockPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    canvas.save();
    // Rotate canvas slightly to make it look like a map perspective
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-0.15);
    canvas.translate(-size.width / 2, -size.height / 2);

    // Draw some thick lines as main roads
    for (double i = -size.width; i < size.width * 2; i += 60) {
      canvas.drawLine(Offset(i, -size.height), Offset(i, size.height * 2), gridPaint);
    }
    for (double i = -size.height; i < size.height * 2; i += 60) {
      canvas.drawLine(Offset(-size.width, i), Offset(size.width * 2, i), gridPaint);
    }
    
    // Draw some solid blocks
    canvas.drawRect(Rect.fromLTWH(40, 100, 100, 80), blockPaint);
    canvas.drawRect(Rect.fromLTWH(200, 50, 120, 90), blockPaint);
    canvas.drawRect(Rect.fromLTWH(100, 250, 150, 100), blockPaint);
    
    canvas.restore();

    // 2. Draw Routes
    final orangePaint = Paint()
      ..color = const Color(0xFFFE660C)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final greyPaint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    // Path from Origin to Truck (Orange)
    Path path1 = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p1.dx + 15, p1.dy - 50)
      ..lineTo(p1.dx + 40, p1.dy - 60)
      ..lineTo(p1.dx + 50, p1.dy - 100)
      ..lineTo(p2.dx, p2.dy);
    canvas.drawPath(path1, orangePaint);

    // Path from Truck to Home (Grey)
    Path path2 = Path()
      ..moveTo(p2.dx, p2.dy)
      ..lineTo(p2.dx + 40, p2.dy - 5)
      ..lineTo(p2.dx + 100, p2.dy + 10)
      ..lineTo(p2.dx + 140, p2.dy - 40)
      ..lineTo(p3.dx, p3.dy);
    canvas.drawPath(path2, greyPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
