import 'package:get/get.dart';

class Cart4Item {
  final String id;
  final String title;
  final String size;
  final String color;
  final double price;
  final String notes;
  int quantity;
  bool isSelected;

  Cart4Item({
    required this.id,
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    this.notes = 'Empty Notes',
    this.quantity = 1,
    this.isSelected = false,
  });
}

class Cart4Seller {
  final String name;
  final bool isVerified;
  List<Cart4Item> items;

  Cart4Seller({
    required this.name,
    this.isVerified = true,
    required this.items,
  });

  bool get allItemsSelected => items.isNotEmpty && items.every((item) => item.isSelected);
  bool get someItemsSelected => items.any((item) => item.isSelected) && !allItemsSelected;
}

class Cart4Controller extends GetxController {
  var sellers = <Cart4Seller>[
    Cart4Seller(
      name: 'Flownkykie',
      items: [
        Cart4Item(
          id: '1',
          title: 'Brown T-Shirt Long Butterfly',
          size: 'L',
          color: 'Brown',
          price: 18.00,
        ),
      ],
    ),
    Cart4Seller(
      name: 'Tissixtwo',
      items: [
        Cart4Item(
          id: '2',
          title: 'Crimson "Seren" Sweatshirt',
          size: 'L',
          color: 'Brown',
          price: 82.00,
        ),
        Cart4Item(
          id: '3',
          title: 'Sky Blue Mock Neck Top',
          size: 'L',
          color: 'Brown',
          price: 42.00,
          notes: 'With Bubble Wra...',
        ),
      ],
    ),
  ].obs;

  bool get allSelected {
    bool hasItems = false;
    for (var seller in sellers) {
      if (seller.items.isNotEmpty) {
        hasItems = true;
        if (!seller.allItemsSelected) return false;
      }
    }
    return hasItems;
  }
  
  bool get someSelected {
    bool hasAny = false;
    for (var seller in sellers) {
      if (seller.items.any((i) => i.isSelected)) hasAny = true;
    }
    return hasAny && !allSelected;
  }

  double get subtotal {
    double total = 0;
    for (var seller in sellers) {
      for (var item in seller.items) {
        if (item.isSelected) {
          total += item.price * item.quantity;
        }
      }
    }
    return total;
  }

  double get deliveryCharges => subtotal > 0 ? 20.00 : 0.00;

  double get total => subtotal + deliveryCharges;

  void toggleItemSelection(String sellerName, String itemId) {
    var sellerIndex = sellers.indexWhere((s) => s.name == sellerName);
    if (sellerIndex != -1) {
      var itemIndex = sellers[sellerIndex].items.indexWhere((i) => i.id == itemId);
      if (itemIndex != -1) {
        sellers[sellerIndex].items[itemIndex].isSelected = !sellers[sellerIndex].items[itemIndex].isSelected;
        sellers.refresh();
      }
    }
  }

  void toggleSellerSelection(String sellerName) {
    var sellerIndex = sellers.indexWhere((s) => s.name == sellerName);
    if (sellerIndex != -1) {
      bool nextState = !sellers[sellerIndex].allItemsSelected;
      for (var item in sellers[sellerIndex].items) {
        item.isSelected = nextState;
      }
      sellers.refresh();
    }
  }

  void toggleAllSelection() {
    bool nextState = !allSelected;
    for (var seller in sellers) {
      for (var item in seller.items) {
        item.isSelected = nextState;
      }
    }
    sellers.refresh();
  }

  void incrementQuantity(String sellerName, String itemId) {
    var sellerIndex = sellers.indexWhere((s) => s.name == sellerName);
    if (sellerIndex != -1) {
      var itemIndex = sellers[sellerIndex].items.indexWhere((i) => i.id == itemId);
      if (itemIndex != -1) {
        sellers[sellerIndex].items[itemIndex].quantity++;
        sellers.refresh();
      }
    }
  }

  void decrementQuantity(String sellerName, String itemId) {
    var sellerIndex = sellers.indexWhere((s) => s.name == sellerName);
    if (sellerIndex != -1) {
      var itemIndex = sellers[sellerIndex].items.indexWhere((i) => i.id == itemId);
      if (itemIndex != -1 && sellers[sellerIndex].items[itemIndex].quantity > 1) {
        sellers[sellerIndex].items[itemIndex].quantity--;
        sellers.refresh();
      }
    }
  }

  void deleteSelectedItems() {
    for (var seller in sellers) {
      seller.items.removeWhere((item) => item.isSelected);
    }
    // Remove empty sellers
    sellers.removeWhere((seller) => seller.items.isEmpty);
    sellers.refresh();
  }
}
