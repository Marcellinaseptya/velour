import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  
  // Animations
  late Animation<double> textOpacity;
  late Animation<double> elementsOpacity;
  
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
    
    // Total animation time is 3.5 seconds
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500), 
    );
    
    // Phase 1: Text "Vel" and "our" fade in (0.0 to 0.2 of 3.5s = 0 to 700ms)
    textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.0, 0.2, curve: Curves.easeIn)),
    );

    // Phase 2: Pills, line, and banners appear (0.4 to 0.7 of 3.5s = 1400ms to 2450ms)
    elementsOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.6, curve: Curves.easeIn)),
    );
    
    pill1Rotation = Tween<double>(begin: 0, end: 0.15).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
    pill1BgColor = ColorTween(begin: const Color(0xFFFF6600), end: const Color(0xFF161616)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
    pill1TextColor = ColorTween(begin: const Color(0xFFFFFFFF), end: const Color(0xFFFF6600)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
    
    pill2Scale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.7, curve: Curves.elasticOut)),
    );
    pill2Rotation = Tween<double>(begin: 0, end: -0.1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
    
    topBannerSlide = Tween<Offset>(begin: const Offset(0, -2.0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic)),
    );
    bottomBannerSlide = Tween<Offset>(begin: const Offset(0, 2.0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic)),
    );

    animationController.forward();
    
    _navigateToNext();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void _navigateToNext() async {
    // Wait for the full animation duration + a small pause
    await Future.delayed(const Duration(milliseconds: 4000));
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
