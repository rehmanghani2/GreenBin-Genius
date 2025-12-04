import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'goal_selection_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Removed the outer Padding so the image can be full width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 36), // Top spacing

            // 1. Top Branding (Added Padding here instead)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'GREENBIN',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF2196F3),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const Spacer(),

            // 2. Illustration (FULL WIDTH)
            // No padding here, so it touches the edges of the screen
            SizedBox(
              width: double.infinity, // Forces it to take full screen width
              child: Image.asset(
                'assets/images/intro_illustration.png',
                fit: BoxFit.fitWidth, // Adjusts height automatically based on width
              ),
            ),

            const Spacer(),

            // 3. Main Welcome Text (Added Padding here)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      children: const [
                        TextSpan(text: 'Welcome to '),
                        TextSpan(
                          text: 'GreenBin',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Let’s Begin Your Eco Journey',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Together we make the world cleaner.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 2),

            // 4. GET STARTED Button (Added Padding here)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GoalSelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 5. Footer Links (Added Padding here)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  children: [
                    const TextSpan(text: 'by continuing you agree to GreenBin '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: const TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ', GreenBin '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),

            // Increased spacing here to separate the sections
            const SizedBox(height: 48),

            // 6. Login Link (Added Padding here)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Login here',
                      style: const TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}