import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../routes/app_pages.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    const buttonColor = Color(0xFFD4550A); // Requested by user

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // --- TILTED BACKGROUND BANNERS ---
            // 1. Dark Orange Banner (steep tilt upwards, crossing from bottom-left to top-right)
            Positioned(
              top: 250,
              left: -100,
              right: -100,
              child: Transform.rotate(
                angle: -0.3, // Steep tilt upwards
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: primaryColor, // Solid dark orange
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      5,
                      (index) => Text(
                        'Merceuk',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // 2. Light Orange Banner (slight tilt downwards, crossing from top-left to mid-right)
            Positioned(
              top: 100,
              left: -50,
              right: -50,
              child: Transform.rotate(
                angle: 0.1, // Slight tilt downwards
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.5), // Light orange
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      5,
                      (index) => Text(
                        'Merceuk',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // --- MAIN CONTENT ---
            Column(
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
                          border: Border.all(color: Colors.grey[300]!),
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
                            'Product Detail',
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
                
                // Product Image Area
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Grey Image Placeholder with Smooth Cutout
                          Stack(
                            children: [
                              // Main grey rectangle
                              Container(
                                height: 280,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              
                              // 1. Smoothing Square for Bottom-Left outer corner
                              Positioned(
                                bottom: 0,
                                right: 155, // Exactly left of the cutout
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  color: Colors.white, // White base
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400], // Matches main grey
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(24),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              // 2. Smoothing Square for Top-Right outer corner
                              Positioned(
                                bottom: 75, // Exactly above the cutout roof
                                right: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  color: Colors.white, // White base
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400], // Matches main grey
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(24),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              // 3. The "cutout" effect achieved with a white overlay
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 155, // Width of cutout area
                                  height: 75, // Height of cutout area
                                  decoration: const BoxDecoration(
                                    color: Colors.white, // Matches scaffold background
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24), // Creates the concave inner corner
                                    ),
                                  ),
                                ),
                              ),
                              // The actual Price Button inside the cutout
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 140,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: buttonColor, // Requested Color(0xFFD4550A)
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '\$82',
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Carousel Thumbnails
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Arrow
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryColor),
                                ),
                                child: const Icon(Icons.chevron_left, color: primaryColor),
                              ),
                              
                              // Thumbnails
                              Obx(() => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.changeImage(0),
                                    child: _buildThumbnail(active: controller.activeImageIndex.value == 0, primaryColor: primaryColor),
                                  ),
                                  const SizedBox(width: 12),
                                  GestureDetector(
                                    onTap: () => controller.changeImage(1),
                                    child: _buildThumbnail(active: controller.activeImageIndex.value == 1, primaryColor: primaryColor),
                                  ),
                                  const SizedBox(width: 12),
                                  GestureDetector(
                                    onTap: () => controller.changeImage(2),
                                    child: _buildThumbnail(active: controller.activeImageIndex.value == 2, primaryColor: primaryColor),
                                  ),
                                ],
                              )),
                              
                              // Right Arrow
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                                child: const Icon(Icons.chevron_right, color: Colors.white),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Product Details Text
                          Text(
                            'Chocolate Gathered Blouse',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'A soft, comfortable brown tee featuring an elegant elongated butterfly graphic that adds a touch of nature-inspired beauty.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey[500],
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Options Row (Colors & Sizes)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Colors Picker
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Color(0xFF4A3424), // Dark brown
                                      ),
                                      const SizedBox(width: 12),
                                      Text('Colors', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 8),
                                      Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 18),
                                    ],
                                  ),
                                ),
                                
                                const SizedBox(width: 16),
                                
                                // Sizes Picker
                                Obx(() => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(
                                    children: [
                                      // Double arrow icon
                                      CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.swap_horiz, color: primaryColor, size: 16),
                                      ),
                                      const SizedBox(width: 12),
                                      GestureDetector(
                                        onTap: () => controller.changeSize('M'),
                                        child: _buildSizeItem('M', controller.selectedSize.value == 'M', primaryColor),
                                      ),
                                      const SizedBox(width: 12),
                                      GestureDetector(
                                        onTap: () => controller.changeSize('L'),
                                        child: _buildSizeItem('L', controller.selectedSize.value == 'L', primaryColor),
                                      ),
                                      const SizedBox(width: 12),
                                      GestureDetector(
                                        onTap: () => controller.changeSize('XL'),
                                        child: _buildSizeItem('XL', controller.selectedSize.value == 'XL', primaryColor),
                                      ),
                                      const SizedBox(width: 12),
                                      GestureDetector(
                                        onTap: () => controller.changeSize('XXL'),
                                        child: _buildSizeItem('XXL', controller.selectedSize.value == 'XXL', primaryColor),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // --- BOTTOM BUTTON ---
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.CART_1),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail({required bool active, required Color primaryColor}) {
    return Container(
      width: 55,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
        border: active ? Border.all(color: primaryColor, width: 1.5) : Border.all(color: Colors.transparent),
      ),
    );
  }

  Widget _buildSizeItem(String text, bool active, Color primaryColor) {
    if (active) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: primaryColor),
        ),
        alignment: Alignment.center,
        child: Text(text, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600)),
      );
    } else {
      return Text(text, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500));
    }
  }
}
