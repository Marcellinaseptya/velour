import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dashboard_controller.dart';
import 'categories_page_2.dart';
import 'filter_page_view.dart';

class MainPage2 extends StatelessWidget {
  const MainPage2({super.key});

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
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[350],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Hey, Reyna',
                          style: GoogleFonts.inter(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 20),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87, size: 20),
                      onPressed: () {},
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
                          Text(
                            'Explore Fashion',
                            style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        const FilterPageView(),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    },
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
            
            // Single Promo Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Kids Sale',
                    style: GoogleFonts.inter(fontSize: 18, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Up to ',
                        style: GoogleFonts.inter(fontSize: 18, color: Colors.black87),
                      ),
                      Text(
                        '76%',
                        style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Shop Now',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
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
                  _buildChip('All', isSelected: true, primaryColor: primaryColor),
                  const SizedBox(width: 12),
                  _buildChip('Women'),
                  const SizedBox(width: 12),
                  _buildChip('Men'),
                  const SizedBox(width: 12),
                  _buildChip('Kids'),
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
                childAspectRatio: 0.65,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    title: 'Sky Blue Mock Neck Top',
                    brand: 'Flownkykie',
                    originalPrice: '\$654',
                    discountPrice: '\$42',
                    badgeText: '35% OFF',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Pinky Shirt (Free Neackle)',
                    brand: 'Flownkykie',
                    discountPrice: '\$82',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Pinky Shirt (Free Neackle)',
                    brand: 'Flownkykie',
                    discountPrice: '\$48',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Petal Pink Basic Tee',
                    brand: 'Flownkykie',
                    discountPrice: '\$44',
                    primaryColor: primaryColor,
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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

  Widget _buildProductCard({
    required String title,
    required String brand,
    String? originalPrice,
    required String discountPrice,
    String? badgeText,
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
                // Discount Badge (if any)
                if (badgeText != null)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badgeText,
                        style: GoogleFonts.inter(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                // Favorite Button
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, color: Colors.black87, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Brand
        Row(
          children: [
            Icon(Icons.verified, color: primaryColor, size: 12),
            const SizedBox(width: 4),
            Text(
              brand,
              style: GoogleFonts.inter(fontSize: 11, color: primaryColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
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
            if (originalPrice != null) ...[
              Text(
                originalPrice,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.grey[400],
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 8),
            ],
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
