import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ReviewPageView extends StatelessWidget {
  const ReviewPageView({super.key});

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
                        'Review',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the title
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // --- RATING SUMMARY ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  // Left side: Overall Rating
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          '4.5',
                          style: GoogleFonts.inter(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => const Icon(
                            Icons.star,
                            color: Color(0xFFFFB800),
                            size: 24,
                          )),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '(107 reviews)',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  Container(
                    height: 100,
                    width: 1,
                    color: Colors.grey[200],
                  ),
                  // Right side: Progress bars
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          _buildProgressBar('5', 0.8),
                          _buildProgressBar('4', 0.25),
                          _buildProgressBar('3', 0.35),
                          _buildProgressBar('2', 0.1),
                          _buildProgressBar('1', 0.05),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // --- SEARCH BAR ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                      'Search review',
                      style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // --- FILTER CHIPS ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  _buildFilterChip('All Review', true, primaryColor),
                  const SizedBox(width: 12),
                  _buildFilterChip('Latest', false, primaryColor),
                  const SizedBox(width: 12),
                  _buildFilterChip('Newest', false, primaryColor),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // --- REVIEW LIST ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildReviewItem(
                    name: 'Theresa Webb',
                    time: 'Newest',
                    text: 'A soft, comfortable brown tee featuring an elegant elongated butterfly graphic that adds a touch of nature-inspired beauty.',
                    rating: 5.0,
                  ),
                  Divider(color: Colors.grey[100], thickness: 1, height: 32),
                  _buildReviewItem(
                    name: 'Esther Howard',
                    time: '11 months ago',
                    text: 'Great quality shirt, but the delivery took a bit longer than expected. Still worth the price.',
                    rating: 4.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // --- BOTTOM BAR ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: Text(
              'Write Review',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, double fillFraction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Stack(
              children: [
                // Background bar
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFE660C).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // Fill bar
                FractionallySizedBox(
                  widthFactor: fillFraction,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFE660C),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String text, bool isActive, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
          color: isActive ? Colors.white : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String time,
    required String text,
    required double rating,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Info Row
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Review Text
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        // Rating Row
        Row(
          children: [
            ...List.generate(5, (index) {
              if (index < rating.floor()) {
                return const Icon(Icons.star, color: Color(0xFFFFB800), size: 16);
              } else if (index < rating) {
                return const Icon(Icons.star_half, color: Color(0xFFFFB800), size: 16);
              } else {
                return Icon(Icons.star, color: Colors.grey[300], size: 16);
              }
            }),
            const SizedBox(width: 8),
            Text(
              rating.toStringAsFixed(1),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
