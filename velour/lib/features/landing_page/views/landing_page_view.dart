import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Velour!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.goToDashboard,
              child: const Text('Masuk ke Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
