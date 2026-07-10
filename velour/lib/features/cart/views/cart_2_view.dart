import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class Cart2View extends GetView<CartController> {
  const Cart2View({super.key});

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
              child: Obx(() => SingleChildScrollView(
                child: Column(
                  children: [
                    // Dynamic Top Action Bar (Selected / Delete)
                    if (controller.hasSelectedItems)
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
                                      selected: controller.allSelected || controller.someSelected,
                                      isPartial: controller.someSelected,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Selected',
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
                    
                    if (controller.hasSelectedItems)
                      const SizedBox(height: 24),
                      
                    if (controller.cartItems.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                        child: Center(
                          child: Text(
                            'Your cart is empty',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ),
                    
                    // Cart Items List
                    ...controller.cartItems.map((item) => Column(
                      children: [
                        _buildCartItem(
                          item: item,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Divider(color: Colors.grey[200], height: 1),
                        ),
                      ],
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Promo Code Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Apply promo code',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Apply',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Order Summary
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
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
              )),
            ),
            
            // Checkout Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(28),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Checkout',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required CartItem item,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Checkbox
          GestureDetector(
            onTap: () => controller.toggleItemSelection(item.id),
            child: _buildCustomCheckbox(selected: item.isSelected),
          ),
          const SizedBox(width: 16),
          // Image placeholder
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 4),
                Text(
                  'size : ${item.size}',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                            onPressed: () => controller.decrementQuantity(item.id),
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
                            onPressed: () => controller.incrementQuantity(item.id),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${item.price}',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
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
        border: selected ? null : Border.all(color: Colors.grey[400]!),
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
