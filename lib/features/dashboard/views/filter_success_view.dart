import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class FilterSuccessView extends StatelessWidget {
  const FilterSuccessView({super.key});

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
                    width: 40,
                    height: 40,
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
                        'Search',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined, color: Colors.black87, size: 20),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // --- SEARCH BAR & FILTER BUTTON ---
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
                        border: Border.all(color: Colors.grey[300]!),
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
                  // Filter Button with Indicator
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 22),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // --- PRODUCT GRID ---
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 0.65, // Adjust this ratio to match the card height
                children: [
                  _buildProductCard(
                    brand: 'Faunyesty',
                    title: 'Brown Shirt',
                    price: '\$62',
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Pinky Shirt (Free Neackle)',
                    price: '\$48',
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Sky Blue Mock Neck Top',
                    price: '\$48',
                  ),
                  _buildProductCard(
                    brand: 'Londoniesty',
                    title: 'Off-Shoulder "London" Crop',
                    price: '\$42',
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Res Long Shirt',
                    price: '\$32',
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Blue T-Shirt',
                    price: '\$82',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // --- FAKE BOTTOM NAVIGATION BAR TO MATCH SCREENSHOT ---
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_filled, 'Home', true),
                _buildNavItem(Icons.favorite_border, 'Favorite', false),
                _buildNavItem(Icons.camera_alt_outlined, 'Screener', false),
                _buildNavItem(Icons.receipt_long_outlined, 'History', false),
                _buildNavItem(Icons.person_outline, 'Profile', false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String brand,
    required String title,
    required String price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Placeholder
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Brand Row
        Row(
          children: [
            const Icon(Icons.verified, color: Color(0xFFFE660C), size: 14), // Tiny seal icon
            const SizedBox(width: 4),
            Text(
              brand,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFE660C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Title
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        // Price
        Text(
          price,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFE660C),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? const Color(0xFFFE660C) : Colors.grey[400]),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? const Color(0xFFFE660C) : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
