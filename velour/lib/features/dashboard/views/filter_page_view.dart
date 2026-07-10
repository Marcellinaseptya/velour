import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class FilterPageView extends StatelessWidget {
  const FilterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // The Filter Content
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  // --- HEADER ---
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1A1A1A),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[200], thickness: 1, height: 1),
                  
                  // --- SCROLLABLE CONTENT ---
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7, // Max height
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CATEGORY
                          Text(
                            'Category',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildPill('T-shirt', true, primaryColor),
                              _buildPill('Crop Top', false, primaryColor),
                              _buildPill('Outerwear', false, primaryColor),
                              _buildPill('Hoodie & Sweatshirt', false, primaryColor),
                              _buildPill('Cardigans', false, primaryColor),
                              _buildPill('Knitwear', false, primaryColor),
                            ],
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // STYLE CATEGORY
                          Text(
                            'Style Category',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildPill('Minimalist', true, primaryColor),
                              _buildPill('Elegant', false, primaryColor),
                              _buildPill('Casual', false, primaryColor),
                              _buildPill('Y2K', false, primaryColor),
                              _buildPill('Office Wear', false, primaryColor),
                              _buildPill('Vintage', false, primaryColor),
                              _buildPill('Sporty', false, primaryColor),
                              _buildPill('Streetwear', false, primaryColor),
                            ],
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // SIZE
                          Text(
                            'Size',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildPill('XS', false, primaryColor),
                              _buildPill('S', false, primaryColor),
                              _buildPill('M', false, primaryColor),
                              _buildPill('L', false, primaryColor),
                              _buildPill('XL', false, primaryColor),
                              _buildPill('XXL', false, primaryColor),
                              _buildPill('Plus Size', false, primaryColor),
                            ],
                          ),
                          
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                  
                  // --- BOTTOM BUTTONS ---
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Clear All',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Apply Filter',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildPill(String text, bool active, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active ? primaryColor : Colors.grey[300]!,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: active ? FontWeight.w500 : FontWeight.w400,
          color: active ? Colors.white : Colors.grey[400],
        ),
      ),
    );
  }
}
