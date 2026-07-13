import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController with GetSingleTickerProviderStateMixin {
  // Can be used to handle dynamic messages if needed
  final String title = Get.arguments?['title'] ?? 'Registration Successful!';
  final String subtitle = Get.arguments?['subtitle'] ?? 'Your account is now ready to shop and\nexplore our best deals.';

  late AnimationController animationController;
  late Animation<double> rotationAnimation;
  late Animation<Offset> bannerSlideAnimation;

  @override
  void onInit() {
    super.onInit();
    
    // Continuous animation loop
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Rotate 360 degrees
    rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159265359).animate(animationController);
    
    // Slide the banner for a marquee effect
    // We'll slide it from dx: 0.0 to dx: -0.5 or similar, depending on the width.
    bannerSlideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-0.2, 0)).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
