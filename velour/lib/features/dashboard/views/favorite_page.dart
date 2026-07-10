import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
                  const SizedBox(width: 44), // Balancer for centering
                  Expanded(
                    child: Center(
                      child: Text(
                        'My Favorite',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.inventory_2_outlined, color: Colors.black87, size: 20),
                      onPressed: () {},
                    ),
                  )
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
                childAspectRatio: 0.65, // Adjust for brand, title, price
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    title: 'Petal Pink Basic Tee',
                    brand: 'Flownkykie',
                    price: '\$482',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Pinky Shirt (Free Neackle)',
                    brand: 'Flownkykie',
                    price: '\$482',
                    primaryColor: primaryColor,
                    isFaded: true, // as seen in screenshot
                  ),
                  _buildProductCard(
                    title: 'Pinky Shirt (Free Neackle)',
                    brand: 'Flownkykie',
                    price: '\$482',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Pinky Shirt (Free Neackle)',
                    brand: 'Flownkykie',
                    price: '\$482',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Sky Blue Mock Neck Top',
                    brand: 'Flownkykie',
                    price: '\$482',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    title: 'Off-Shoulder "London" Crop',
                    brand: 'Flownkykie',
                    price: '\$482',
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
    required String price,
    required Color primaryColor,
    bool isFaded = false,
  }) {
    return Opacity(
      opacity: isFaded ? 0.4 : 1.0,
      child: Column(
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
                  // Favorite Button (Red Heart)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite, color: Colors.red, size: 14),
                    ),
                  ),
                  // Add to Cart Button (Orange)
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
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
          Text(
            price,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
