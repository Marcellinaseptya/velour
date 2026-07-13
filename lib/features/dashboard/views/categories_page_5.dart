import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class CategoriesPage5 extends StatelessWidget {
  const CategoriesPage5({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
                      onPressed: () {
                        if (Get.previousRoute.isEmpty) {
                          Get.offAllNamed(Routes.DASHBOARD);
                        } else {
                          Get.back();
                        }
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Product Category',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40), // Spacer to balance the title
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Search Bar
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
              
              const SizedBox(height: 16),
              
              // Filter Pills
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    _buildFilterPill('all categories'),
                    const SizedBox(width: 12),
                    _buildFilterPill('Men'),
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
      ),
    );
  }

  Widget _buildFilterPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
          ),
          const SizedBox(width: 6),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 16),
        ],
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
