import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetail2View extends GetView<ProductDetailController> {
  const ProductDetail2View({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
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
            
            // --- SCROLLABLE CONTENT ---
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- MAIN IMAGE WITH SMOOTH CUTOUT ---
                      Stack(
                        children: [
                          // Grey placeholder
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
                            right: 145, // Exactly left of the cutout
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
                            bottom: 65, // Exactly above the cutout roof
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
                          
                          // 3. Main Cutout Cover
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 145,
                              height: 65,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24), // Inner concave curve
                                ),
                              ),
                            ),
                          ),
                          
                          // Price Button inside cutout
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 130,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFB54500), // Darker orange
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '\$39.99',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          
                          // Top Right Favorite Button
                          Positioned(
                            top: 16,
                            right: 16,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: const Icon(Icons.favorite_border, color: Colors.grey),
                            ),
                          ),
                          
                          // Left Arrow
                          Positioned(
                            top: 153, // centered vertically
                            left: 8,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.chevron_left, color: Colors.white, size: 24),
                            ),
                          ),
                          
                          // Right Arrow
                          Positioned(
                            top: 153,
                            right: 8,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.chevron_right, color: Colors.white, size: 24),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // --- DOTS INDICATOR ---
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => controller.changeImage(0),
                            child: _buildDot(active: controller.activeImageIndex.value == 0, color: controller.activeImageIndex.value == 0 ? primaryColor : Colors.grey[300]!),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeImage(1),
                            child: _buildDot(active: controller.activeImageIndex.value == 1, color: controller.activeImageIndex.value == 1 ? primaryColor : Colors.grey[300]!),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeImage(2),
                            child: _buildDot(active: controller.activeImageIndex.value == 2, color: controller.activeImageIndex.value == 2 ? primaryColor : Colors.grey[300]!),
                          ),
                          GestureDetector(
                            onTap: () => controller.changeImage(3),
                            child: _buildDot(active: controller.activeImageIndex.value == 3, color: controller.activeImageIndex.value == 3 ? primaryColor : Colors.grey[300]!),
                          ),
                        ],
                      )),
                      
                      const SizedBox(height: 24),
                      
                      // --- PRODUCT INFO ---
                      Text(
                        'Casual Tan Blazer + Black Tee',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: primaryColor, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            '4.7 / 5',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            ' (1,428 verified buyers)',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // --- SIZE PICKER ---
                      Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => controller.changeSize('S'),
                              child: _buildSizeCircle('S', controller.selectedSize.value == 'S', primaryColor),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => controller.changeSize('M'),
                              child: _buildSizeCircle('M', controller.selectedSize.value == 'M', primaryColor),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => controller.changeSize('L'),
                              child: _buildSizeCircle('L', controller.selectedSize.value == 'L', primaryColor),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => controller.changeSize('XL'),
                              child: _buildSizeCircle('XL', controller.selectedSize.value == 'XL', primaryColor),
                            ),
                          ],
                        ),
                      )),
                      
                      const SizedBox(height: 24),
                      
                      // --- ACCORDION HEADER ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'View Product Details',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_up, color: Colors.black87),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // --- DESCRIPTION TEXT ---
                      Text(
                        'Versatile two-piece outfit featuring a classic tan blazer paired with a minimalist black tee. Suitable for office, semi-formal events, café meetings, and everyday styling. Simple, clean, and timeless.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            
            // --- BOTTOM BAR (QUANTITY & ADD TO CART) ---
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                children: [
                  // Quantity Selector
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.remove, color: Colors.white, size: 18),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '1',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Add to Cart Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.CART_1),
                      child: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({required bool active, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? color : color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSizeCircle(String text, bool active, Color primaryColor) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: active ? primaryColor : Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
          color: active ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
