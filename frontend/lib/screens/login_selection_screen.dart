import 'package:flutter/material.dart';
import 'login_form_screen.dart'; // Navigate to the form

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        // Title "GREENBIN" in Grey to match "LITTERATI" watermark style
        title: Text(
          'GREENBIN',
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Main Instruction Text
              const Text(
                'Login to your existing GreenBin\naccount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),

              // Login With Email Button (Light Blue)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginFormScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3F2FD), // Light Blue Background
                    foregroundColor: const Color(0xFF2196F3), // Blue Text & Icon
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.mail_outline, size: 22),
                  label: const Text(
                    'LOGIN WITH EMAIL',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Image Placeholder at the bottom
              Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/intro_illustration.png', // Using existing asset as placeholder
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}