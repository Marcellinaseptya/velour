import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/success_controller.dart';
import '../../../routes/app_pages.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Bottom Tilted Banner
          Positioned(
            bottom: 105, // Lowered slightly from 120
            left: -500, // Center the 1500px banner on the screen so rotation doesn't push it off-screen
            child: Transform.rotate(
              angle: -0.1, // Made it more tilted
              child: SlideTransition(
                position: controller.bannerSlideAnimation,
                child: Container(
                  height: 50,
                  width: 3000, // Make it extra wide so it can scroll
                  color: const Color(0xFFFFE0D2), // Light orange background
                  alignment: Alignment.center,
                  child: Text(
                    "Velour  " * 40,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                
                // Icon Area
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Outer Circle
                        Container(
                          width: 210,
                          height: 210,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFEBE3), // Very light orange
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Middle Circle
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD6C4), // Light orange
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Inner Solid Circle
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 64,
                            ),
                          ),
                        ),
                        
                        // Scattered Dots with Rotation Animation
                        AnimatedBuilder(
                          animation: controller.animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: controller.rotationAnimation.value,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 15,
                                    left: 45,
                                    child: Container(width: 22, height: 22, decoration: const BoxDecoration(color: Color(0xFFFFAA77), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    top: 25,
                                    left: 80,
                                    child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFD35400), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    top: 25,
                                    right: 65,
                                    child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFFB38A), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    top: 40,
                                    right: 40,
                                    child: Container(width: 18, height: 18, decoration: const BoxDecoration(color: Color(0xFFCC5200), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    top: 75,
                                    right: 28,
                                    child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFFF9955), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    bottom: 75,
                                    right: 32,
                                    child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFFF9955), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    bottom: 85,
                                    left: 25,
                                    child: Container(width: 16, height: 16, decoration: const BoxDecoration(color: Color(0xFF662900), shape: BoxShape.circle)),
                                  ),
                                  Positioned(
                                    bottom: 65,
                                    left: 40,
                                    child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFFFB38A), shape: BoxShape.circle)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Title
                Text(
                  controller.title,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFD4550A), // Custom darker orange color
                    fontSize: 20,
                    fontWeight: FontWeight.w700, // Made it slightly bolder
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 12),
                
                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    controller.subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.black87,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const Spacer(flex: 3),
                
                // Button
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 110.0), // Reverted to 110.0
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Get.offAllNamed(Routes.DASHBOARD), // Navigate to Dashboard
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Start Shopping',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
