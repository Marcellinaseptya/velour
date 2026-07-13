import 'package:get/get.dart';

class RegisterController extends GetxController {
  final isTermsAccepted = false.obs;

  void toggleTerms(bool? value) {
    if (value != null) {
      isTermsAccepted.value = value;
    }
  }
}
