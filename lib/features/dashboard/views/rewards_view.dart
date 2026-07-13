import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
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
                        'Rewards',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 44), // balance centering
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Points Card (No Redeem Button as per mockup)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B1B1D),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          _buildCoinsIcon(),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '150 Points',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Redeem your point now!',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section: Limited Time Voucher
                    Text(
                      'Limited Time Voucher',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Horizontal scroll view for Limited Time Vouchers
                    SizedBox(
                      height: 145,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildLimitedTimeCard(
                            discount: '15% Off All\nDress',
                            points: 80,
                            cardBgColor: const Color(0xFFCCCCCC),
                            buttonColor: primaryColor,
                          ),
                          const SizedBox(width: 16),
                          _buildLimitedTimeCard(
                            discount: '25% Off All\nDress',
                            points: 120,
                            cardBgColor: primaryColor,
                            buttonColor: const Color(0xFF1B1B1D),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section: Recommended Rewards
                    Text(
                      'Recommended Rewards',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Recommended Rewards Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85, // Changed from 0.65 to 0.85 to make it more square
                      children: [
                        _buildRecommendedCard(
                          title: 'Free\nCowboy Hat',
                          points: 210,
                        ),
                        _buildRecommendedCard(
                          title: '15% Off\nAll Dress',
                          points: 80,
                        ),
                        _buildRecommendedCard(
                          title: '35% Off\nGlasses',
                          points: 210,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinsIcon() {
    return SizedBox(
      width: 32,
      height: 24,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: _buildSingleCoin(),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: _buildSingleCoin(),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCoin() {
    return Container(
      width: 20,
      height: 14,
      decoration: BoxDecoration(
        color: const Color(0xFFFE660C).withOpacity(0.2),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFFE660C), width: 1.5),
      ),
    );
  }

  Widget _buildLimitedTimeCard({
    required String discount,
    required int points,
    required Color cardBgColor,
    required Color buttonColor,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            discount,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Points Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1B1D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$points Points',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              
              // Redeem Button
              ElevatedButton(
                onPressed: () => _handleRedeem(discount.replaceAll('\n', ' ')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  minimumSize: const Size(60, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Redeem Point',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCard({
    required String title,
    required int points,
  }) {
    const primaryColor = Color(0xFFFE660C);

    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF999999), Color(0xFF1B1B1D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Outlined Points Badge
              Container(
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), // Reduced radius to 6
                  border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
                ),
                child: Text(
                  '$points Points',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Redeem Button
              SizedBox(
                height: 32,
                child: ElevatedButton(
                  onPressed: () => _handleRedeem(title.replaceAll('\n', ' ')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Redeem Point',
                    style: GoogleFonts.inter(
                      fontSize: 11,
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

  void _handleRedeem(String rewardName) {
    Get.snackbar(
      'Success!',
      'Voucher "$rewardName" redeemed successfully.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFFFFEBE3),
      colorText: const Color(0xFFFE660C),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10),
    );
  }
}
