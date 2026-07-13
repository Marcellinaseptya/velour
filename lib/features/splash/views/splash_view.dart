import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF6600);
    
    // Font ditipiskan lagi sesuai permintaan (dari w700 menjadi w600)
    final TextStyle logoStyle = GoogleFonts.inter(
      fontSize: 100,
      fontWeight: FontWeight.w600, // Dibuat lebih tipis lagi (SemiBold)
      color: primaryColor,
      height: 1.0,
      letterSpacing: -5.5, 
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              // --- BANNER ATAS ---
              Positioned(
                top: 40,
                left: -200,
                child: FadeTransition(
                  opacity: controller.elementsOpacity,
                  child: SlideTransition(
                    position: controller.topBannerSlide,
                    child: Transform.rotate(
                      angle: -0.05,
                      child: Container(
                        height: 50,
                        width: 1500,
                        color: primaryColor,
                        alignment: Alignment.center,
                        child: Text(
                          "Velour  " * 20,
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
              ),

              // --- BANNER BAWAH ---
              Positioned(
                bottom: 40,
                left: -200,
                child: FadeTransition(
                  opacity: controller.elementsOpacity,
                  child: SlideTransition(
                    position: controller.bottomBannerSlide,
                    child: Transform.rotate(
                      angle: -0.05,
                      child: Container(
                        height: 50,
                        width: 1500,
                        color: primaryColor,
                        alignment: Alignment.center,
                        child: Text(
                          "Velour  " * 20,
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
              ),

              // --- LOGO UTAMA ---
              Center(
                child: Transform.scale(
                  scale: 0.70, 
                  child: SizedBox(
                    width: 280, 
                    height: 160,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // 1. Teks "Vel" 
                        Positioned(
                          left: 11,
                          top: 0,
                          child: FadeTransition(
                            opacity: controller.textOpacity,
                            child: Text('Vel', style: logoStyle),
                          ),
                        ),
                        
                        // 2. Garis Bawah 
                        Positioned(
                          left: 7,
                          top: 124, 
                          child: FadeTransition(
                            opacity: controller.elementsOpacity,
                            child: Container(
                              height: 12, 
                              width: 90, 
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        
                        // 3. Teks "our" 
                        Positioned(
                          left: 112, 
                          top: 44,   
                          child: FadeTransition(
                            opacity: controller.textOpacity,
                            child: Text('our', style: logoStyle),
                          ),
                        ),
                        
                        // 4. Pill "Velour" (Atas - Animasi Rotasi & Warna)
                        Positioned(
                          left: 136,
                          top: 14,   
                          child: FadeTransition(
                            opacity: controller.elementsOpacity,
                            child: Transform.rotate(
                              angle: controller.pill1Rotation.value,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                                decoration: BoxDecoration(
                                  color: controller.pill1BgColor.value,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Velour',
                                  style: GoogleFonts.inter(
                                    color: controller.pill1TextColor.value,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // 5. Pill 2 Baru (Bawah - Animasi Scale & Rotasi)
                        Positioned(
                          left: -50,
                          top: 135,
                          child: FadeTransition(
                            opacity: controller.elementsOpacity,
                            child: Transform.scale(
                              scale: controller.pill2Scale.value,
                              child: Transform.rotate(
                                angle: controller.pill2Rotation.value,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF161616),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Velour',
                                    style: GoogleFonts.inter(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
