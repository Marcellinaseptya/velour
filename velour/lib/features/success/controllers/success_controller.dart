import 'package:get/get.dart';

class SuccessController extends GetxController {
  // Can be used to handle dynamic messages if needed
  final String title = Get.arguments?['title'] ?? 'Registration Successful!';
  final String subtitle = Get.arguments?['subtitle'] ?? 'Your account is now ready to shop and\nexplore our best deals.';
}
