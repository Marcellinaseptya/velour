import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'Chat',
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
            const SizedBox(height: 24),

            // Chat List
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildChatItem(
                    name: 'Flownkykie',
                    message: 'Hi there, how can i help you?',
                    time: 'Now',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Zago',
                    message: 'Hi there, how can i help you?',
                    time: '09:16 PM',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Junx Xiera Fashion',
                    message: 'Hi! I just found some new...',
                    time: '10:24 PM',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Inwood',
                    message: 'Hi there, how can i help you?',
                    time: '11 January 2025',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Fatboy',
                    message: 'Hi there, how can i help you?',
                    time: '12 January 2025',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Id\'Click',
                    message: 'Hi there, how can i help you?',
                    time: '14 January 2025',
                  ),
                  _buildDivider(),
                  _buildChatItem(
                    name: 'Presse Citron',
                    message: 'Hi there, how can i help you?',
                    time: '14 January 2025',
                  ),
                  const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Divider(color: Colors.grey[200], thickness: 1, height: 1),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String time,
  }) {
    const primaryColor = Color(0xFFFE660C);

    return InkWell(
      onTap: () => Get.toNamed(Routes.CHAT_DETAIL),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar Placeholder
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFC4C4C4), // Grey placeholder
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2), // small alignment tweak
                  Row(
                    children: [
                      // Verified Icon
                      const Icon(
                        Icons.verified, // closest to the jagged star checkmark
                        color: primaryColor,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                time,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
