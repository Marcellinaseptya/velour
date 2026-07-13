import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/register_controller.dart';
import '../../../routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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

    Widget buildTextField(String label, String hint, {bool isPassword = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 13, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: GoogleFonts.inter(color: Colors.grey[400], fontSize: 13),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              suffixIcon: isPassword ? const Icon(Icons.visibility_off_outlined, color: Colors.black87) : null,
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
          const SizedBox(height: 16),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // The Velour Logo (centered)
              Center(
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
              
              const SizedBox(height: 32),
              
              buildTextField('Full Name', 'Type your name'),
              buildTextField('Email Address', 'Type email to register'),
              buildTextField('Phone Number', 'Your mobile number'),
              buildTextField('Password', 'Password (min. 8 characters)', isPassword: true),
              buildTextField('Confirm Password', 'Re-enter password', isPassword: true),
              
              // Terms and Conditions Checkbox
              Row(
                children: [
                  Obx(() => Checkbox(
                    value: controller.isTermsAccepted.value,
                    onChanged: controller.toggleTerms,
                    activeColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  )),
                  Text(
                    'Terms & Privacy Policy agreement',
                    style: GoogleFonts.inter(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Register Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.SUCCESS),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
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
              
              const SizedBox(height: 16),
              
              // Google Register
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
                        'Register with Google',
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
              
              const SizedBox(height: 48),
              
              // Have an account?
              Center(
                child: GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.LOGIN),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
                      children: [
                        const TextSpan(text: "Have an account? "),
                        TextSpan(
                          text: 'Login',
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
