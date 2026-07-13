import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class CategoriesPage4 extends StatelessWidget {
  const CategoriesPage4({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                hintText: 'Explore Product',
                                hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: GoogleFonts.inter(fontSize: 14),
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
                childAspectRatio: 0.65, // Adjust based on text content
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                children: [
                  _buildProductCard(
                    brand: 'Faunyasty',
                    title: 'Chocolate Gathered Blouse',
                    price: '\$62',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Petal Pink Basic Tee',
                    price: '\$48',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Sky Blue Mock Neck Top',
                    price: '\$48',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    brand: 'Londoniesty',
                    title: 'Off-Shoulder "London" Crop',
                    price: '\$42',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Res Long Shirt',
                    price: '\$32',
                    primaryColor: primaryColor,
                  ),
                  _buildProductCard(
                    brand: 'Flownkykie',
                    title: 'Blue T-Shirt',
                    price: '\$82',
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
    required String brand,
    required String title,
    required String price,
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
                // Favorite Button (Top Right)
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      if (Get.isRegistered<DashboardController>()) {
                        Get.find<DashboardController>().changeTab(1);
                        Get.offAllNamed(Routes.DASHBOARD);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_border, color: Colors.black87, size: 14),
                    ),
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
          style: GoogleFonts.inter(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Price
        Text(
          price,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
