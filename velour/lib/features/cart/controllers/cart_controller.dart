import 'package:get/get.dart';

class CartItem {
  final String id;
  final String title;
  final String size;
  final double price;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.title,
    required this.size,
    required this.price,
    this.quantity = 1,
    this.isSelected = false,
  });
}

class CartController extends GetxController {
  // Dummy data
  var cartItems = <CartItem>[
    CartItem(id: '1', title: 'Casual Tan Blazer +\nBlack Tee', size: 'M', price: 59.99),
    CartItem(id: '2', title: 'Casual Tan Blazer\n+ Black Tee', size: 'M', price: 59.99),
    CartItem(id: '3', title: 'Crimson "Seren" Sweatshirt', size: 'M', price: 59.99),
  ].obs;

  bool get hasSelectedItems => cartItems.any((item) => item.isSelected);
  
  bool get allSelected => cartItems.isNotEmpty && cartItems.every((item) => item.isSelected);
  
  bool get someSelected => hasSelectedItems && !allSelected;

  double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        total += item.price * item.quantity;
      }
    }
    return total;
  }

  double get deliveryCharges => subtotal > 0 ? 20.00 : 0.00;

  double get total => subtotal + deliveryCharges;

  void toggleItemSelection(String id) {
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].isSelected = !cartItems[index].isSelected;
      cartItems.refresh(); // Refresh .obs list to trigger UI update
    }
  }

  void toggleAllSelection() {
    bool nextState = !allSelected;
    for (var item in cartItems) {
      item.isSelected = nextState;
    }
    cartItems.refresh();
  }

  void incrementQuantity(String id) {
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(String id) {
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void deleteSelectedItems() {
    cartItems.removeWhere((item) => item.isSelected);
  }
}
