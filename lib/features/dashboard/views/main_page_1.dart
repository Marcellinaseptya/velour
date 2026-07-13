import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dashboard_controller.dart';
import 'categories_page_1.dart';
import 'filter_page_view.dart';
import '../../../routes/app_pages.dart';

class MainPage1 extends StatelessWidget {
  const MainPage1({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[350],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Afternoon',
                        style: GoogleFonts.inter(color: Colors.grey[500], fontSize: 12),
                      ),
                      Text(
                        'Reynata Partin',
                        style: GoogleFonts.inter(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.mail_outline, color: Colors.black87, size: 20),
                      onPressed: () => Get.toNamed(Routes.MESSAGE_LIST),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[600], size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Explore Fashion',
                                hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: GoogleFonts.inter(color: Colors.black87, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.FILTER_PAGE),
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.tune, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 28),
            
            // Popular Item Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Popular Item',
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Popular Item Swipeable Cards
            SizedBox(
              height: 260,
              child: PageView(
                controller: PageController(viewportFraction: 0.95), // Allows peaking at next item
                children: [
                  _buildPopularItemCard(
                    primaryColor: primaryColor,
                    discount: '15%',
                    rating: '4.8',
                  ),
                  _buildPopularItemCard(
                    primaryColor: primaryColor,
                    discount: '25%',
                    rating: '4.9',
                  ),
                  _buildPopularItemCard(
                    primaryColor: primaryColor,
                    discount: '30%',
                    rating: '5.0',
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 28),
            
            // Categories Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Categories',
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Get.toNamed(Routes.CATEGORY_1), child: _buildChip('All', isSelected: true, primaryColor: primaryColor)),
                  const SizedBox(width: 12),
                  GestureDetector(onTap: () => Get.toNamed(Routes.CATEGORY_2), child: _buildChip('Women')),
                  const SizedBox(width: 12),
                  GestureDetector(onTap: () => Get.toNamed(Routes.CATEGORY_3), child: _buildChip('Men')),
                  const SizedBox(width: 12),
                  GestureDetector(onTap: () => Get.toNamed(Routes.CATEGORY_4), child: _buildChip('Kids')),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Products Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
                    child: _buildProductCard(
                      title: 'Sky Blue Mock Neck Top',
                      originalPrice: '\$64',
                      discountPrice: '\$54',
                      primaryColor: primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
                    child: _buildProductCard(
                      title: 'London Shirt',
                      originalPrice: '\$44',
                      discountPrice: '\$42',
                      primaryColor: primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
                    child: _buildProductCard(
                      title: 'Petal Pink Basic Tee',
                      originalPrice: '\$54',
                      discountPrice: '\$35',
                      primaryColor: primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
                    child: _buildProductCard(
                      title: 'Jeans Jumpsuit',
                      originalPrice: '\$52.24',
                      discountPrice: '\$24.99',
                      primaryColor: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false, Color? primaryColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildPopularItemCard({
    required Color primaryColor,
    required String discount,
    required String rating,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Back Card
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 12), // Reduced margin since PageView handles spacing
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        // Front Card
        Container(
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 36),
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Discount Text
              Positioned(
                top: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Up to',
                      style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
                    ),
                    Text(
                      discount,
                      style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              // Rating Badge
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              // See All Button
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'See All',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required String title,
    required String originalPrice,
    required String discountPrice,
    required Color primaryColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Container
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Rating
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add to Cart Button
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: const Icon(Icons.arrow_outward, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Title
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Prices
        Row(
          children: [
            Text(
              originalPrice,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[400],
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              discountPrice,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
