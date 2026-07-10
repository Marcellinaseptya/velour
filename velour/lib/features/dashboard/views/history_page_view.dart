import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HistoryPageView extends StatelessWidget {
  const HistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // --- HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Text(
                  'History',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
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
                    Icon(Icons.search, color: Colors.black87, size: 22),
                    const SizedBox(width: 12),
                    Text(
                      'Search your package',
                      style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // --- FILTER CHIPS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {}, // Already here
                      child: _buildFilterChip('All Package', true, primaryColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.offNamed('/history-ongoing'),
                      child: _buildFilterChip('On process', false, primaryColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.offNamed('/history-completed'),
                      child: _buildFilterChip('Completed', false, primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // --- PACKAGE LIST ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildPackageCard(
                    title: 'Brown T-Shirt',
                    brand: 'Flownkykie',
                    statusText: 'Transit',
                    statusColor: const Color(0xFF1A1A1A),
                    estimatedDate: '12 January, 2025',
                    location: '123 Fashion Ave, New York',
                    currentStep: 2, // 0-indexed: 0=check, 1=check, 2=active
                    activeIcon: Icons.local_shipping_outlined,
                  ),
                  const SizedBox(height: 20),
                  _buildPackageCard(
                    title: 'Pinky Shirt (Free neackle)',
                    brand: 'Flownkykie',
                    statusText: 'Delivered',
                    statusColor: const Color(0xFFF6A74B), // yellow-orange
                    estimatedDate: '19 Oct 2025',
                    location: 'Jalanan Caatur, Yogyakarta',
                    currentStep: 3, // 0=check, 1=check, 2=check, 3=active
                    activeIcon: Icons.two_wheeler,
                  ),
                  const SizedBox(height: 20),
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
                _buildNavItem(Icons.home_outlined, 'Home', false),
                _buildNavItem(Icons.favorite_border, 'Favorite', false),
                _buildNavItem(Icons.camera_alt_outlined, 'Screener', false),
                _buildNavItem(Icons.receipt_long, 'History', true),
                _buildNavItem(Icons.person_outline, 'Profile', false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String text, bool isActive, Color primaryColor) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Colors.white : Colors.grey[500],
        ),
      ),
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String brand,
    required String statusText,
    required Color statusColor,
    required String estimatedDate,
    required String location,
    required int currentStep,
    required IconData activeIcon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.verified, color: Color(0xFFFE660C), size: 14),
                        const SizedBox(width: 4),
                        Text(
                          brand,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFE660C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Image and Details Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimated',
                      style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.inventory_2_outlined, size: 14, color: Colors.grey[800]),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            estimatedDate,
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Currently Location',
                      style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[800]),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            location,
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Tracking Roadmap and Button
          Row(
            children: [
              Expanded(
                child: _buildRoadmap(currentStep, activeIcon),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => Get.toNamed('/tracking-detail'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFE660C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Track package',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmap(int currentStep, IconData activeIcon) {
    List<Widget> children = [];
    const int totalSteps = 4;
    
    for (int i = 0; i < totalSteps; i++) {
      // Build Dot
      if (i < currentStep) {
        // Completed
        children.add(
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFE660C), width: 1.5),
            ),
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFFFE660C),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 12),
              ),
            ),
          )
        );
      } else if (i == currentStep) {
        // Active
        children.add(
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFE660C), width: 1.5),
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A), // Black fill
                  shape: BoxShape.circle,
                ),
                child: Icon(activeIcon, color: Colors.white, size: 12),
              ),
            ),
          )
        );
      } else {
        // Pending
        children.add(
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1.5),
            ),
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        );
      }

      // Build Line (if not last)
      if (i < totalSteps - 1) {
        bool isLineActive = i < currentStep;
        children.add(
          Expanded(
            child: _buildDashedLine(isLineActive),
          )
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }

  Widget _buildDashedLine(bool isActive) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashHeight = 1.5;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFFE660C) : Colors.grey[300],
                ),
              ),
            );
          }),
        );
      },
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
