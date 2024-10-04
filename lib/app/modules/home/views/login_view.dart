import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart'; // Import LoginController

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A82FB), // Gradient color 1
                Color(0xFFFC5C7D), // Gradient color 2
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Music!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Login to your account',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              _buildLoginForm(),
              const SizedBox(height: 20),
              _buildLoginButton(),
              const SizedBox(height: 10),
              _buildSignUpLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              controller.email.value = value; // Update email in controller
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Email',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.email, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              controller.password.value = value; // Update password in controller
            },
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.lock, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Obx(() {
      return ElevatedButton(
        onPressed: controller.isLoading.value ? null : () {
          controller.login(); // Call login function in controller
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: controller.isLoading.value
            ? const CircularProgressIndicator() // Show loading spinner
            : const Text(
          'Login',
          style: TextStyle(color: Color(0xFF6A82FB), fontSize: 18),
        ),
      );
    });
  }

  Widget _buildSignUpLink() {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/signup'); // Ganti dengan route pendaftaran
      },
      child: const Text(
        'Don\'t have an account? Sign Up',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
