import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final RxInt activeImageIndex = 0.obs;
  final RxString selectedSize = 'M'.obs;
  final RxInt selectedColorIndex = 0.obs;
  final RxInt activeTabIndex = 0.obs;

  void changeImage(int index) {
    activeImageIndex.value = index;
  }

  void changeSize(String size) {
    selectedSize.value = size;
  }

  void changeColor(int index) {
    selectedColorIndex.value = index;
  }

  void changeTab(int index) {
    activeTabIndex.value = index;
  }
}
