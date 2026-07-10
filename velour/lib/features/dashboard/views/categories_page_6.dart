import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CategoriesPage6 extends StatelessWidget {
  const CategoriesPage6({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Header Section
            Container(
              width: double.infinity,
              color: const Color(0xFF8C8C8C),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 24,
                right: 24,
                bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Discover\nMore Style',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  _buildChip('All', isSelected: true, primaryColor: primaryColor),
                  const SizedBox(width: 12),
                  _buildChip('Casual'),
                  const SizedBox(width: 12),
                  _buildChip('Sport'),
                  const SizedBox(width: 12),
                  _buildChip('Outdoor'),
                  const SizedBox(width: 12),
                  _buildChip('Classic'),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Filter Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filter By relevance',
                      style: GoogleFonts.inter(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 14),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Products Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.58, // Adjust based on text height
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    title: 'Midnight Navy Button-Up',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
                  ),
                  _buildProductCard(
                    title: 'Chocolate Gathered Blouse',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
                  ),
                  _buildProductCard(
                    title: 'Sky Blue Mock Neck Top',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
                  ),
                  _buildProductCard(
                    title: 'Essential Fleece Pullover',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
                  ),
                  _buildProductCard(
                    title: 'Crimson "Seren" Sweatshirt',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
                  ),
                  _buildProductCard(
                    title: 'Off-Shoulder "London" Crop',
                    subtitle: 'Soft fleece interior',
                    price: '\$34.90',
                    rating: '4.9',
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
        color: isSelected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: isSelected ? Colors.white : Colors.grey[400],
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String subtitle,
    required String price,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  // Rating Badge (Top Left)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.orangeAccent, size: 10),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold, height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(fontSize: 10, color: Colors.grey[400]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
