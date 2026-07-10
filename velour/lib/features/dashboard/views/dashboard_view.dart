import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dashboard_controller.dart';
import 'main_page_1.dart';
import 'main_page_2.dart';
import 'main_page_3.dart';
import 'main_page_4.dart';
import 'favorite_page.dart';
import 'categories_page_1.dart';
import 'categories_page_2.dart';
import 'categories_page_3.dart';
import 'categories_page_4.dart';
import 'categories_page_7.dart';
import 'scanner_page.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.selectedTab.value == 0) {
          if (Get.currentRoute == '/category-7') {
            return const CategoriesPage7();
          } else if (Get.currentRoute == '/category-4') {
            return const CategoriesPage4();
          } else if (Get.currentRoute == '/category-3') {
            return const CategoriesPage3();
          } else if (Get.currentRoute == '/category-2') {
            return const CategoriesPage2();
          } else if (Get.currentRoute == '/category-1') {
            return const CategoriesPage1();
          } else if (Get.currentRoute == '/main-page-4') {
            return const MainPage4();
          } else if (Get.currentRoute == '/main-page-3') {
            return const MainPage3();
          } else if (Get.currentRoute == '/main-page-2') {
            return const MainPage2();
          }
          // Default to MainPage1
          return const MainPage1();
        } else if (controller.selectedTab.value == 1) {
          return const FavoritePage();
        } else if (controller.selectedTab.value == 2) {
          return const ScannerPage();
        }
        return Center(child: Text('Tab ${controller.selectedTab.value}'));
      }),
      bottomNavigationBar: Obx(() => _buildBottomNavBar(primaryColor)),
    );
  }

  Widget _buildBottomNavBar(Color primaryColor) {
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
          currentIndex: controller.selectedTab.value,
          onTap: controller.changeTab,
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
}
