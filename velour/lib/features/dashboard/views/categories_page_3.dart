import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage3 extends StatelessWidget {
  const CategoriesPage3({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            
            // Search Bar (Full Width)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                      'Search',
                      style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
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
                childAspectRatio: 0.7, // Adjusted for image and text
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    title: 'Sky Blue Mock Neck Top',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Flowers Pinky Dress',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Off-Shoulder "London" Crop',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Essential Fleece Pullover',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'White Shirt',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Petal Pink Basic Tee',
                    originalPrice: '\$654',
                    discountPrice: '\$654',
                    rating: '4.8',
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
    required String originalPrice,
    required String discountPrice,
    required String rating,
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
                // Rating Badge (Top Left)
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.orangeAccent, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Arrow Button (Bottom Right)
                Positioned(
                  bottom: -10, // Overflow slightly or align bottom. The screenshot shows it touching the bottom edge. Let's position it just inside.
                  right: -10, // No wait, the screenshot has it positioned at the bottom right corner of the grey image, overflowing slightly.
                  child: Transform.translate(
                    offset: const Offset(-8, -8),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_outward, color: Colors.black87, size: 16),
                    ),
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
          style: GoogleFonts.inter(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Price
        Row(
          children: [
            Text(
              originalPrice,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.grey[400],
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              discountPrice,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
