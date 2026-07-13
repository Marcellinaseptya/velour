import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../dashboard/views/success_seal.dart';

class OrderConfirmedView extends StatelessWidget {
  const OrderConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 3),
              
              // 1. Success Seal Custom Paint
              Center(
                child: SuccessSeal(
                  size: 160,
                  color: primaryColor,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // 2. Title Text
              Text(
                'Order Confirmed',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // 3. Subtitle Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Thank you for your purchase! A confirmation\nemail has been sent to your inbox. You can\ntrack your order status anytime.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[400],
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              
              const Spacer(flex: 4),
              
              // 4. Continue Shopping Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.DASHBOARD);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Continue Shopping',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // 5. Share Button (Outlined)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Shared!',
                      'Order link copied to clipboard.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: const Color(0xFFFFEBE3),
                      colorText: primaryColor,
                      duration: const Duration(seconds: 2),
                      margin: const EdgeInsets.only(top: 10),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: const BorderSide(color: primaryColor, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.share_outlined,
                        color: primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Share',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
