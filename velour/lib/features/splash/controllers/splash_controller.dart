import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  
  // Animations
  late Animation<double> pill1Rotation;
  late Animation<Color?> pill1BgColor;
  late Animation<Color?> pill1TextColor;
  
  late Animation<double> pill2Scale;
  late Animation<double> pill2Rotation;
  
  late Animation<Offset> topBannerSlide;
  late Animation<Offset> bottomBannerSlide;

  @override
  void onInit() {
    super.onInit();
    
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Total 2.5 detik animasi
    );
    
    // Interval konfigurasi animasi
    
    // Pill 1 (Kanan Atas) berubah warna dan berputar perlahan
    pill1Rotation = Tween<double>(begin: 0, end: 0.15).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.2, 0.6, curve: Curves.easeInOut)),
    );
    pill1BgColor = ColorTween(begin: const Color(0xFFFF6600), end: const Color(0xFF161616)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.2, 0.5, curve: Curves.easeInOut)),
    );
    pill1TextColor = ColorTween(begin: const Color(0xFFFFFFFF), end: const Color(0xFFFF6600)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.2, 0.5, curve: Curves.easeInOut)),
    );
    
    // Pill 2 (Kiri Bawah) muncul membesar (scale)
    pill2Scale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.3, 0.7, curve: Curves.elasticOut)),
    );
    pill2Rotation = Tween<double>(begin: 0, end: -0.1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.3, 0.6, curve: Curves.easeInOut)),
    );
    
    // Banner diagonal meluncur dari atas dan bawah
    topBannerSlide = Tween<Offset>(begin: const Offset(0, -2.0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic)),
    );
    bottomBannerSlide = Tween<Offset>(begin: const Offset(0, 2.0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic)),
    );

    // Mulai animasi secara otomatis
    animationController.forward();
    
    _navigateToNext();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void _navigateToNext() async {
    // Menunggu 3 detik agar animasi splash screen punya waktu untuk selesai
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
