import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    const bgColor = Color(0xFFF4F4F4);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // 1. Sliding Content (Image and Text)
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.updateIndex,
            itemCount: controller.contents.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Full width image placeholder (takes available space)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE0E0E0), Color(0xFFF4F4F4)],
                        ),
                      ),
                    ),
                  ),
                  // Text Area (takes natural height, adapts to text length)
                  Container(
                    width: double.infinity,
                    color: bgColor,
                    padding: EdgeInsets.fromLTRB(32, 32, 32, index == controller.contents.length - 1 ? 140.0 : 88.0), // Smaller gap for the buttons
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Indicators
                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              controller.contents.length,
                              (idx) => _buildIndicator(
                                isActive: idx == controller.currentIndex.value,
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 32),
                        Text(
                          controller.contents[index].title,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF121212),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          controller.contents[index].subtitle,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF848484),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          
          // 2. Static Skip Button
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                child: Obx(() => controller.currentIndex.value == controller.contents.length - 1
                    ? const SizedBox.shrink()
                    : TextButton(
                        onPressed: controller.skip,
                        child: Text(
                          'Skip',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      )),
              ),
            ),
          ),
          
          // 3. Static Next Button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                child: Obx(() {
                  final isLastPage = controller.currentIndex.value == controller.contents.length - 1;
                  
                  if (isLastPage) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => Get.offAllNamed(Routes.REGISTER), // Go to Register
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Register',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () => Get.offAllNamed(Routes.LOGIN), // Go to Login
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: const BorderSide(color: Colors.black87),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: controller.next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Next',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: isActive ? 32 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
    );
  }
}

