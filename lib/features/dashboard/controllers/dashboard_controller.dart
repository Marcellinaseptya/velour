import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt selectedTab = 0.obs;
  final RxInt selectedHistoryTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void changeHistoryTab(int index) {
    selectedHistoryTab.value = index;
  }
}
