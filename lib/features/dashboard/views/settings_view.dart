import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    final RxBool isPushEnabled = true.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Settings',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 44), // To balance the back button
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Account & Privacy Control',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Settings List
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildSettingsItem(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.lock_outline,
                    title: 'Password & Security',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.notifications_none,
                    title: 'Push Notifications',
                    trailing: Obx(() => Switch(
                          value: isPushEnabled.value,
                          onChanged: (val) => isPushEnabled.value = val,
                          activeColor: Colors.white,
                          activeTrackColor: primaryColor,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey[300],
                        )),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Account Permissions',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () => _showLanguageBottomSheet(context),
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.flag_outlined,
                    title: 'Country',
                    onTap: () => _showCountryBottomSheet(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Divider(color: Colors.grey[200], thickness: 1, height: 1),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: trailing == null ? onTap : null, // Disable tap if it has a switch (handled by switch itself)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            if (trailing != null)
              trailing
            else
              const Icon(
                Icons.chevron_right,
                color: Colors.black54,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.85, // Made taller
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Language',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close, color: Colors.black87, size: 18),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildLanguageItem('English', null),
                  _buildDivider(),
                  _buildLanguageItem('中文 (简体)', 'Chinese'),
                  _buildDivider(),
                  _buildLanguageItem('日本語', 'Japanese'),
                  _buildDivider(),
                  _buildLanguageItem('Tiếng Việt', 'Vietnamese'),
                  _buildDivider(),
                  _buildLanguageItem('العربية', 'Arabic'),
                  _buildDivider(),
                  _buildLanguageItem('Türkçe', 'Turkish'),
                  _buildDivider(),
                  _buildLanguageItem('Bahasa Indonesia', null),
                  _buildDivider(),
                  _buildLanguageItem('Bahasa Melayu', null),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true, // Allow it to be taller than half screen
      backgroundColor: Colors.transparent,
      ignoreSafeArea: false,
    );
  }

  Widget _buildLanguageItem(String title, String? subtitle) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showCountryBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Country',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close, color: Colors.black87, size: 18),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildCountryItem('Austria'),
                  _buildDivider(),
                  _buildCountryItem('Azerbaijan'),
                  _buildDivider(),
                  _buildCountryItem('Croatia'),
                  _buildDivider(),
                  _buildCountryItem('Cyprus'),
                  _buildDivider(),
                  _buildCountryItem('Czechia'),
                  _buildDivider(),
                  _buildCountryItem('Denmark'),
                  _buildDivider(),
                  _buildCountryItem('Estonia'),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      ignoreSafeArea: false,
    );
  }

  Widget _buildCountryItem(String title) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFC4C4C4),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
