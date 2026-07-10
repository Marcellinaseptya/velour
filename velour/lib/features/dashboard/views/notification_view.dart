import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../routes/app_pages.dart';

class NotificationItemModel {
  final int id;
  final String title;
  final String description;
  final IconData icon;
  bool isRead;
  final String group;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.isRead,
    required this.group,
  });
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late List<NotificationItemModel> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = [
      NotificationItemModel(
        id: 1,
        title: 'Flash Sale Alert',
        description: 'Hurry! ⚡ The Flash Sale ends in 1 hour. Grab your dream items to 70% off!',
        icon: Icons.discount_outlined,
        isRead: true,
        group: 'Today',
      ),
      NotificationItemModel(
        id: 2,
        title: 'Order #9021 Shipped',
        description: 'You received a special discount voucher. Redeem it before expiry.',
        icon: Icons.inventory_2_outlined,
        isRead: false,
        group: 'Today',
      ),
      NotificationItemModel(
        id: 3,
        title: 'Special Voucher',
        description: 'Just for you! 🎁 Claim your \$5 discount today. Use code: SAVEBIG before it expires',
        icon: Icons.discount_outlined,
        isRead: true,
        group: 'Today',
      ),
      NotificationItemModel(
        id: 4,
        title: 'New Arrival',
        description: 'Just In! The latest collection for this season is now live. Be the first to rock the new look!',
        icon: Icons.checkroom_outlined,
        isRead: true,
        group: 'Yesterday',
      ),
      NotificationItemModel(
        id: 5,
        title: 'Review Request',
        description: 'Share your feedback and earn 100 loyalty points as a thank you!',
        icon: Icons.discount_outlined,
        isRead: true,
        group: 'Yesterday',
      ),
      NotificationItemModel(
        id: 6,
        title: 'Back in Stock',
        description: 'Great news! 🎉 That item you were eyeing is back in stock. Don\'t miss out this time shop now!',
        icon: Icons.inventory_2_outlined,
        isRead: true,
        group: 'Yesterday',
      ),
    ];
  }

  void _markAllAsRead() {
    setState(() {
      for (var item in _notifications) {
        item.isRead = true;
      }
    });
  }

  void _markAsRead(int id) {
    setState(() {
      final index = _notifications.indexWhere((item) => item.id == id);
      if (index != -1) {
        _notifications[index].isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    final dashboardController = Get.find<DashboardController>();

    final todayItems = _notifications.where((item) => item.group == 'Today').toList();
    final yesterdayItems = _notifications.where((item) => item.group == 'Yesterday').toList();

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
                        'Notification',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _markAllAsRead,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      minimumSize: const Size(60, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Mark all as read',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // Today Section
                  if (todayItems.isNotEmpty) ...[
                    _buildSectionHeader('Today'),
                    ...todayItems.map((item) => _buildNotificationTile(item)),
                    const SizedBox(height: 16),
                  ],

                  // Yesterday Section
                  if (yesterdayItems.isNotEmpty) ...[
                    _buildSectionHeader('Yesterday'),
                    ...yesterdayItems.map((item) => _buildNotificationTile(item)),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, primaryColor, dashboardController),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.grey[200], thickness: 1, height: 1),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(NotificationItemModel item) {
    const primaryColor = Color(0xFFFE660C);
    
    // Unread background is a very light pinkish orange (0xFFFFEBE3), read is white.
    final Color bgColor = item.isRead ? Colors.white : const Color(0xFFFFEBE3).withOpacity(0.4);

    return InkWell(
      onTap: () => _markAsRead(item.id),
      child: Container(
        width: double.infinity,
        color: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Orange Icon Box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                item.icon,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    item.title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey[500],
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
          currentIndex: 0, // "Home" is active as in mockup
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
}
