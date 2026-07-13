import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LandingPageController extends GetxController {
  void goToDashboard() {
    Get.toNamed(Routes.DASHBOARD);
  }
}
