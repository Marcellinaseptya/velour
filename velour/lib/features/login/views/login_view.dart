import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFE660C);
    
    // Scaled down exact font size (100 * 0.35 = 35)
    final TextStyle logoStyle = GoogleFonts.inter(
      fontSize: 35, 
      fontWeight: FontWeight.w600,
      color: primaryColor,
      height: 1.0,
      letterSpacing: -1.9,
    );

    return Scaffold(
      backgroundColor: Colors.white, // Using white background as per screenshot
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Back Button and Logo Row
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
                      onPressed: () => Get.back(),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  // The Velour Logo (mathematically scaled to avoid empty layout space)
                  Transform.translate(
                    offset: const Offset(12, 0), // Geser sedikit ke kanan
                    child: SizedBox(
                      width: 98,
                    height: 56,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 3.8,
                          top: 0,
                          child: Text('Vel', style: logoStyle),
                        ),
                        Positioned(
                          left: 2.4,
                          top: 43.4,
                          child: Container(
                            height: 4.2,
                            width: 31.5,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 39.2,
                          top: 15.4,
                          child: Text('our', style: logoStyle),
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Email Field
              Text(
                'Email or phone number',
                style: GoogleFonts.inter(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter email / phone number',
                  hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 13),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Password Field
              Text(
                'Password',
                style: GoogleFonts.inter(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter password',
                  hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 13),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(
                    color: primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(
                    Routes.SUCCESS,
                    arguments: {
                      'title': 'Login Successful!',
                      'subtitle': 'Welcome back! Your account is now ready\nto shop and explore our best deals.'
                    },
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Or Text
              Center(
                child: Text(
                  'Or',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Google Login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(color: Colors.black87),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Login with Google',
                        style: GoogleFonts.inter(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 64),
              
              // Don't have an account?
              Center(
                child: GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.REGISTER),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Register',
                          style: GoogleFonts.inter(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
