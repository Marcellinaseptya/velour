import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFD35400); // Slightly darker orange for chat
    const bgColor = Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
                  const SizedBox(width: 12),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4), // Grey placeholder
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Junx Xiera Fashion',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Last seen 2 hours ago',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Chat Body
            Expanded(
              child: Container(
                color: bgColor,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        'Today',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Received Message 1
                    _buildReceivedMessage(
                      time: '10.24 PM',
                      child: Text(
                        'Hi! I just found some new arrivals 👗✨\nMind if I share a few pieces with you?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Sent Message 1
                    _buildSentMessage(
                      time: '10.24 PM',
                      primaryColor: primaryColor,
                      child: Text(
                        'Do you have more colors or styles for\nmy business trip?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Received Message 2 (with images)
                    _buildReceivedMessage(
                      time: '10.28 PM',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Large image placeholder
                              Container(
                                width: 140,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Two small image placeholders
                              Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 76,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC4C4C4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 100,
                                    height: 76,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC4C4C4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Here are some best-selling pieces from our\nlatest drop. Let me know if you want details',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Sent Message 2
                    _buildSentMessage(
                      time: '10.30 PM',
                      primaryColor: primaryColor,
                      child: Text(
                        'These are super cute, can you check if\nsize M is still available for the first one?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Input Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.black87, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type Here...',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.camera_alt, color: Colors.black87, size: 20),
                    const SizedBox(width: 12),
                    Icon(Icons.mic, color: Colors.black87, size: 20),
                    const SizedBox(width: 12),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFF0E6), // Light orange
                      ),
                      child: const Center(
                        child: Icon(Icons.send, color: Color(0xFFFE660C), size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedMessage({required String time, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(4), // Sharper bottom left
            ),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _buildSentMessage({required String time, required Color primaryColor, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.done_all, color: Colors.green, size: 14),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(4), // Sharper bottom right
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
