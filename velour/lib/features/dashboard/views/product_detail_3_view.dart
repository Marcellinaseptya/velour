import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetail3View extends GetView<ProductDetailController> {
  const ProductDetail3View({super.key});

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
                      // --- MAIN IMAGE WITH PLATFORM ---
                      SizedBox(
                        height: 420,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            // The Oval Platform at the bottom
                            Positioned(
                              bottom: 20,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey[50], // Very light fill
                                  borderRadius: const BorderRadius.all(Radius.elliptical(400, 50)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                  border: Border.all(color: Colors.grey[200]!, width: 2),
                                ),
                              ),
                            ),
                            
                            // Main Grey Rectangle (Product Image)
                            Positioned(
                              top: 0,
                              bottom: 40, // Sits on top of the platform
                              child: Container(
                                width: MediaQuery.of(context).size.width - 120, // narrower than screen
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  // No rounded corners at the bottom to sit flat on the platform
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Navigation Arrows at bottom center of the image
                            Positioned(
                              bottom: 30, // Overlapping the bottom edge
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[300]!),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.chevron_left, color: Colors.grey[600], size: 20),
                                    const SizedBox(width: 8),
                                    Icon(Icons.chevron_right, color: Colors.grey[600], size: 20),
                                  ],
                                ),
                              ),
                            ),
                            
                            // Vertical Dots Indicator on the right
                            Positioned(
                              right: 0,
                              top: 150,
                              child: Obx(() => Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.changeImage(0),
                                    child: _buildDot(active: controller.activeImageIndex.value == 0, color: controller.activeImageIndex.value == 0 ? primaryColor : Colors.grey[300]!),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.changeImage(1),
                                    child: _buildDot(active: controller.activeImageIndex.value == 1, color: controller.activeImageIndex.value == 1 ? primaryColor : Colors.grey[300]!),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.changeImage(2),
                                    child: _buildDot(active: controller.activeImageIndex.value == 2, color: controller.activeImageIndex.value == 2 ? primaryColor : Colors.grey[300]!),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.changeImage(3),
                                    child: _buildDot(active: controller.activeImageIndex.value == 3, color: controller.activeImageIndex.value == 3 ? primaryColor : Colors.grey[300]!),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // --- PRODUCT TITLE & PRICE ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Black line one-\nbutton Blazer',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star, color: primaryColor, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '4.7',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '\$59.99',
                                style: GoogleFonts.inter(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
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
                      
                      // --- DESCRIPTION TEXT ---
                      Text(
                        'Versatile two-piece outfit featuring a classic tan blazer paired with a minimalist black tee. Suitable for office, semi-formal events, café meetings, and everyday styling. Simple, clean, and timeless.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // --- PACKAGE INCLUDES (ACCORDION) ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Package Includes',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_up, color: Colors.black87),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBulletItem('1 x Tan Blazer'),
                            const SizedBox(height: 6),
                            _buildBulletItem('1 x Black Basic Tee'),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            
            // --- BOTTOM BAR (CART ICON & BUY NOW) ---
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                children: [
                  // Cart Button
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.shopping_cart_outlined, color: primaryColor, size: 24),
                  ),
                  const SizedBox(width: 16),
                  // Buy Now Button
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
                          'Buy Now',
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
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
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

  Widget _buildBulletItem(String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
