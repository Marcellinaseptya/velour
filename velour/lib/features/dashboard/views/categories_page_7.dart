import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CategoriesPage7 extends StatelessWidget {
  const CategoriesPage7({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Categories',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance for centering
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
                    Text(
                      'Search Product',
                      style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Main Content: 3 Perfect Rows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // --- ROW 1: T-Shirts (Left) and Outer (Right) ---
                  // Both items must have the EXACT SAME height to form a perfect rectangle.
                  SizedBox(
                    height: 220, // Fixed height for perfect top & bottom alignment
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left Block: T-Shirts
                        Expanded(
                          child: _buildWhiteCard(title: 'T-Shirts', subtitle: '123k Items'),
                        ),
                        const SizedBox(width: 16),
                        // Right Block: Outer + Button
                        Expanded(
                          child: _buildOuterBlock(primaryColor),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // --- ROW 2: MIDDLE BANNER ---
                  // A single full-width continuous banner
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 11,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hoodies & Sweatshirts',
                                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '1.2k items',
                                  style: GoogleFonts.inter(fontSize: 12, color: Colors.white.withOpacity(0.9)),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'See All',
                                    style: GoogleFonts.inter(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // --- ROW 3: Accessories (Left) and T-Shirts (Right) ---
                  SizedBox(
                    height: 220, // Fixed height for perfect alignment
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left Block: Accessories
                        Expanded(
                          child: _buildAccessoriesBlock(),
                        ),
                        const SizedBox(width: 16),
                        // Right Block: T-Shirts (Orange)
                        Expanded(
                          child: _buildOrangeTShirtBlock(primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildWhiteCard({required String title, required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(subtitle, style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOuterBlock(Color primaryColor) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Outer', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 4),
                      Text('1.2k items', style: GoogleFonts.inter(fontSize: 11, color: Colors.white.withOpacity(0.9))),
                    ],
                  ),
                ),
                // Left step (shorter)
              Positioned(
                bottom: 0,
                right: 80, // Positioned next to the right step
                left: 0,  // Stretches all the way to the left edge of the card
                height: 75, 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(12), // Match the card's border radius
                    ),
                  ),
                ),
              ),
                // Right step (taller, touching the right edge)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 80, // Wider
                    height: 110, // Taller
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildViewAllButton(),
      ],
    );
  }

  Widget _buildAccessoriesBlock() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Accessories', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                      const SizedBox(height: 4),
                      Text('2.4k items', style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500])),
                    ],
                  ),
                ),
                // Irregular grey shape using two containers
              // Right step (taller)
              Positioned(
                bottom: 0,
                right: 0,
                left: 60, 
                height: 100, 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(12)),
                  ),
                ),
              ),
              // Left step (shorter)
              Positioned(
                bottom: 0,
                left: 0, 
                right: 60, 
                height: 70, 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8), 
                      topRight: Radius.circular(8), 
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildViewAllButton(),
      ],
    );
  }

  Widget _buildOrangeTShirtBlock(Color primaryColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('T-Shirts', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Text('1.2k items', style: GoogleFonts.inter(fontSize: 11, color: Colors.white.withOpacity(0.9))),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            top: 70,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Container(
      height: 36,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black87),
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: Text(
        'View All',
        style: GoogleFonts.inter(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w600),
      ),
    );
  }
}
