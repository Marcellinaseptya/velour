import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetail1View extends GetView<ProductDetailController> {
  const ProductDetail1View({super.key});

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
                      // Main Image Placeholder
                      Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Thumbnails (Centered)
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      
                      const SizedBox(height: 32),
                      
                      // Title & Favorite Button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Chocolate Gathered Blouse',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: const Icon(Icons.favorite_border, color: Colors.grey),
                          ),
                        ],
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
                      
                      const SizedBox(height: 24),
                      
                      // Tabs (Description, Review, Material)
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                        ),
                        child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => controller.changeTab(0),
                              child: _buildTabItem('Description', active: controller.activeTabIndex.value == 0),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeTab(1),
                              child: _buildTabItem('Review', active: controller.activeTabIndex.value == 1),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeTab(2),
                              child: _buildTabItem('Material', active: controller.activeTabIndex.value == 2),
                            ),
                          ],
                        )),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Description Content
                      Text(
                        'A soft, comfortable brown tee featuring an elegant elongated butterfly graphic that adds a touch of nature-inspired beauty. A soft, comfortable brown tee featuring an elegant elongated butterfly graphic that adds a touch of nature-inspired beauty.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '\$482',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Add to Cart Button
                      GestureDetector(
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
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
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
  
  Widget _buildTabItem(String title, {required bool active}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
          color: active ? Colors.black87 : Colors.grey[500],
        ),
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
