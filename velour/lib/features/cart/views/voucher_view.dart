import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 18),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Voucher',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance for centering
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Voucher Code Input Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B6B6B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Voucher Code',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your voucher code here',
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: Colors.grey[400],
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Redeem',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Free Shipping Voucher',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Active Voucher
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TicketWidget(
                        bgColor: const Color(0xFFFFE8D6),
                        borderColor: primaryColor,
                        cutoutY: 90.0,
                        child: Column(
                          children: [
                            _buildTopPart(
                              iconColor: primaryColor,
                              titleColor: Colors.black87,
                              subtitleColor: Colors.grey[600]!,
                            ),
                            _buildBottomPart(
                              clockColor: Colors.black87,
                              timeText: 'Expires in 24 Hours',
                              timeColor: Colors.red[600]!,
                              btnBgColor: primaryColor,
                              btnTextColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Disabled Voucher with Banner
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TicketWidget(
                        bgColor: Colors.white,
                        borderColor: Colors.grey[300]!,
                        cutoutY: 90.0,
                        child: Column(
                          children: [
                            _buildTopPart(
                              iconColor: Colors.grey[400]!,
                              titleColor: Colors.grey[400]!,
                              subtitleColor: Colors.grey[400]!,
                            ),
                            _buildBottomPart(
                              clockColor: Colors.grey[400]!,
                              timeText: 'Expires in 31 Dec 2027',
                              timeColor: Colors.grey[400]!,
                              btnBgColor: Colors.grey[300]!,
                              btnTextColor: Colors.white,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              color: const Color(0xFFFFE8D6),
                              child: Text(
                                'Spend Rp50,000 more to get this voucher',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Disabled Voucher without Banner
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TicketWidget(
                        bgColor: Colors.white,
                        borderColor: Colors.grey[300]!,
                        cutoutY: 90.0,
                        child: Column(
                          children: [
                            _buildTopPart(
                              iconColor: Colors.grey[400]!,
                              titleColor: Colors.grey[400]!,
                              subtitleColor: Colors.grey[400]!,
                            ),
                            _buildBottomPart(
                              clockColor: Colors.grey[400]!,
                              timeText: 'Expires in 31 Dec 2027',
                              timeColor: Colors.grey[400]!,
                              btnBgColor: Colors.grey[300]!,
                              btnTextColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPart({
    required Color iconColor,
    required Color titleColor,
    required Color subtitleColor,
  }) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.local_shipping_outlined, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Shipping Voucher',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: subtitleColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Free Shipping Rp40.000',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Min. spend Rp100,000 on selected methods.',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: subtitleColor,
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

  Widget _buildBottomPart({
    required Color clockColor,
    required String timeText,
    required Color timeColor,
    required Color btnBgColor,
    required Color btnTextColor,
  }) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.schedule, color: clockColor, size: 16),
            const SizedBox(width: 6),
            Text(
              timeText,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: timeColor,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: btnBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Use',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: btnTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketWidget extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final double cutoutY;
  final Widget child;

  const TicketWidget({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.cutoutY,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketBorderPainter(borderColor: borderColor, cutoutY: cutoutY),
      child: ClipPath(
        clipper: TicketClipper(cutoutY: cutoutY),
        child: Container(
          color: bgColor,
          child: child,
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double cutoutY;
  TicketClipper({required this.cutoutY});
  
  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = 10.0;
    double cornerRadius = 8.0;
    
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.arcToPoint(Offset(size.width, cornerRadius), radius: Radius.circular(cornerRadius));
    
    path.lineTo(size.width, cutoutY - radius);
    path.arcToPoint(
      Offset(size.width, cutoutY + radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    
    path.lineTo(size.width, size.height - cornerRadius);
    path.arcToPoint(Offset(size.width - cornerRadius, size.height), radius: Radius.circular(cornerRadius));
    
    path.lineTo(cornerRadius, size.height);
    path.arcToPoint(Offset(0, size.height - cornerRadius), radius: Radius.circular(cornerRadius));
    
    path.lineTo(0, cutoutY + radius);
    path.arcToPoint(
      Offset(0, cutoutY - radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    
    path.lineTo(0, cornerRadius);
    path.arcToPoint(Offset(cornerRadius, 0), radius: Radius.circular(cornerRadius));
    
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class TicketBorderPainter extends CustomPainter {
  final Color borderColor;
  final double cutoutY;

  TicketBorderPainter({required this.borderColor, required this.cutoutY});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var path = Path();
    double radius = 10.0;
    double cornerRadius = 8.0;
    
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.arcToPoint(Offset(size.width, cornerRadius), radius: Radius.circular(cornerRadius));
    
    path.lineTo(size.width, cutoutY - radius);
    path.arcToPoint(
      Offset(size.width, cutoutY + radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    
    path.lineTo(size.width, size.height - cornerRadius);
    path.arcToPoint(Offset(size.width - cornerRadius, size.height), radius: Radius.circular(cornerRadius));
    
    path.lineTo(cornerRadius, size.height);
    path.arcToPoint(Offset(0, size.height - cornerRadius), radius: Radius.circular(cornerRadius));
    
    path.lineTo(0, cutoutY + radius);
    path.arcToPoint(
      Offset(0, cutoutY - radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    
    path.lineTo(0, cornerRadius);
    path.arcToPoint(Offset(cornerRadius, 0), radius: Radius.circular(cornerRadius));

    canvas.drawPath(path, paint);

    var dashPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
      
    double dashWidth = 5, dashSpace = 5, startX = 16.0;
    while (startX < size.width - 16.0) {
      canvas.drawLine(
        Offset(startX, cutoutY),
        Offset(startX + dashWidth, cutoutY),
        dashPaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
