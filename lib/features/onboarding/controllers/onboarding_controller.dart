import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class OnboardingContent {
  final String title;
  final String subtitle;

  OnboardingContent({required this.title, required this.subtitle});
}

class OnboardingController extends GetxController {
  late PageController pageController;
  final RxInt currentIndex = 0.obs;

  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: 'Change Your Perspective\nin Style with Velour',
      subtitle: 'Enjoy a seamless shopping experience with intuitive search, organized categories, and made just for you.',
    ),
    OnboardingContent(
      title: 'Discover Shopping\nwith Your New Style',
      subtitle: 'Discover a wide selection of fashion and everyday essentials, all curated to help you shop faster.',
    ),
    OnboardingContent(
      title: 'Curated Fashion,\nPersonalized for You',
      subtitle: 'Unlock special offers, limited-time discounts, and the best prices updated daily to give you every purchase.',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void skip() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void next() {
    if (currentIndex.value < contents.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
