import 'package:get/get.dart';

class FilterController extends GetxController {
  // We use RxSet to easily toggle and check if an item is selected
  var selectedCategories = <String>{}.obs;
  var selectedStyles = <String>{}.obs;
  var selectedSizes = <String>{}.obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void toggleStyle(String style) {
    if (selectedStyles.contains(style)) {
      selectedStyles.remove(style);
    } else {
      selectedStyles.add(style);
    }
  }

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
  }

  void clearAll() {
    selectedCategories.clear();
    selectedStyles.clear();
    selectedSizes.clear();
  }

  void applyFilter() {
    // Logic to apply filter can be placed here.
    // For now, just close the bottom sheet.
    Get.back();
  }
}
