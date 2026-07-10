import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../routes/app_pages.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    final dashboardController = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined, color: Colors.black87, size: 24),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Colors.black87, size: 24),
                      onPressed: () => Get.toNamed(Routes.NOTIFICATION),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Profile Avatar Stack (Centered with adjusted edit button alignment)
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 220,
                      height: 125,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Grey Avatar with Black Border (centered: left 55 in a 220 wide Stack)
                          Positioned(
                            top: 0,
                            left: 55,
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 3.5),
                                color: const Color(0xFFCCCCCC),
                              ),
                            ),
                          ),
                          
                          // Pencil Edit Button (positioned at right 15, bottom 2: aligned vertically with the badge and 8px gap with avatar)
                          // Pencil Edit Button (positioned at right 15, bottom 0: aligned vertically with the badge and 8px gap with avatar)
                          Positioned(
                            bottom: 0,
                            right: 15,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.edit, color: Colors.white, size: 16),
                                onPressed: () {},
                              ),
                            ),
                          ),

                          // Premium Member Capsule Badge (centered under the avatar: center of 220 is 110, bottom 4 for vertical alignment)
                          Positioned(
                            bottom: 4,
                            left: 35,
                            width: 150,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  'Premium Member',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Margareth Cortez',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Points Dark Banner
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1B1D),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Coins Icon
                    _buildCoinsIcon(),
                    const SizedBox(width: 14),
                    // Points Details
                    Expanded(
                      child: Column(
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
                    ),
                    // Redeem Button
                    ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.REWARDS),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        'Redeem',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Account Management Section Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Account Management',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Options List
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildOptionItem(
                    icon: Icons.confirmation_number_outlined,
                    title: 'Vouchers & Coupons',
                    subtitle: 'Check available discounts.',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildOptionItem(
                    icon: Icons.credit_card_outlined,
                    title: 'Payment Methods',
                    subtitle: 'Manage saved payment options',
                    onTap: () => Get.toNamed(Routes.PAYMENT_METHOD),
                  ),
                  _buildDivider(),
                  _buildOptionItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    subtitle: 'Get assistance with your account',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildOptionItem(
                    icon: Icons.logout_outlined,
                    title: 'Sign Out',
                    subtitle: null,
                    onTap: () => _showSignOutDialog(context),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, primaryColor, dashboardController),
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

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Divider(color: Colors.grey[100], thickness: 1, height: 1),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        child: Row(
          children: [
            // Icon Square Box
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.black87,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, Color primaryColor, DashboardController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          currentIndex: 4, // Profile tab is active
          onTap: (index) {
            controller.changeTab(index);
            Get.offAllNamed(Routes.DASHBOARD);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 11),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4, top: 8), child: Icon(Icons.home_filled)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4, top: 8), child: Icon(Icons.favorite_border)),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4, top: 8), child: Icon(Icons.camera_alt_outlined)),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4, top: 8), child: Icon(Icons.receipt_long_outlined)),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4, top: 8), child: Icon(Icons.person_outline)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Sign Out',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: GoogleFonts.inter(color: Colors.grey[600]),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.LOGIN); // Returns to Login flow
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              'Sign Out',
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
