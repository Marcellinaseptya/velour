import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/cart_4_controller.dart';
import '../../../routes/app_pages.dart';

class Cart4View extends GetView<Cart4Controller> {
  const Cart4View({super.key});

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
                        'My Cart',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance for centering
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // Top Action Bar (Select All / Delete)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => controller.toggleAllSelection(),
                                child: Row(
                                  children: [
                                    _buildCustomCheckbox(
                                      selected: controller.allSelected,
                                      isPartial: controller.someSelected,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Select All',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.deleteSelectedItems(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1A1A), // Almost black
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Delete',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      if (controller.sellers.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Text(
                            'Your cart is empty',
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[500]),
                          ),
                        ),
                      
                      // Sellers List
                      ...controller.sellers.map((seller) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Seller Header
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => controller.toggleSellerSelection(seller.name),
                                      child: _buildCustomCheckbox(
                                        selected: seller.allItemsSelected,
                                        isPartial: seller.someItemsSelected,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      seller.name,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    if (seller.isVerified)
                                      Icon(Icons.verified, size: 16, color: Colors.black87),
                                  ],
                                ),
                              ),
                              // Items List for Seller
                              ...seller.items.map((item) => _buildCartItem(item: item, sellerName: seller.name)),
                            ],
                          ),
                        ),
                      )),
                      
                      const SizedBox(height: 16),
                      
                      // Voucher Dropdown
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Voucher',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Order Summary
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '\$ ${controller.subtotal.toStringAsFixed(2)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Charges',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '\$${controller.deliveryCharges.toStringAsFixed(2)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Divider(color: Colors.grey[200], thickness: 1),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '\$${controller.total.toStringAsFixed(2)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }),
            ),
            
            // Proceed to Payment Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.ORDER),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Proceed to Payment',
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
    );
  }

  Widget _buildCartItem({required Cart4Item item, required String sellerName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Checkbox
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: GestureDetector(
              onTap: () => controller.toggleItemSelection(sellerName, item.id),
              child: _buildCustomCheckbox(selected: item.isSelected),
            ),
          ),
          const SizedBox(width: 12),
          // Content column (Image+Notes and Details)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image + Notes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.notes, size: 14, color: Colors.grey[500]),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 70, // limit text width
                          child: Text(
                            item.notes,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: Colors.grey[500],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Color: ${item.color} , Size: ${item.size}',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${item.price.toStringAsFixed(0)}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          // Quantity Selector
                          Container(
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                  icon: const Icon(Icons.remove, size: 12, color: Colors.grey),
                                  onPressed: () => controller.decrementQuantity(sellerName, item.id),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                  icon: const Icon(Icons.add, size: 12, color: Colors.grey),
                                  onPressed: () => controller.incrementQuantity(sellerName, item.id),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCheckbox({required bool selected, bool isPartial = false}) {
    const primaryColor = Color(0xFFFE660C);
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: selected ? null : Border.all(color: Colors.grey[300]!),
      ),
      alignment: Alignment.center,
      child: selected
          ? Icon(
              isPartial ? Icons.remove : Icons.check,
              size: 14,
              color: Colors.white,
            )
          : null,
    );
  }
}
