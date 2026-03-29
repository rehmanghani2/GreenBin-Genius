import 'dart:async';
import 'package:flutter/material.dart';
import 'get_started_screen.dart'; // Import to allow navigation

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 1. Wait for 3 seconds, then go to Get Started Screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. The Blue Wavy Background
      body: Stack(
        children: [
          // Background shapes
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          // Center Text
          Center(
            child: Text(
              'GREENBIN',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Custom Painter to draw the Blue Waves
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Base Blue Color
    final paint = Paint();
    paint.color = const Color(0xFF2196F3); // Material Blue 500
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Top Right Light Curve
    final path1 = Path();
    path1.moveTo(size.width * 0.2, 0);
    path1.quadraticBezierTo(
        size.width * 0.6, size.height * 0.3,
        size.width, size.height * 0.45
    );
    path1.lineTo(size.width, 0);
    path1.close();

    // Semi-transparent white for the overlap effect
    paint.color = Colors.white.withOpacity(0.1);
    canvas.drawPath(path1, paint);

    // Bottom Left Light Curve
    final path2 = Path();
    path2.moveTo(0, size.height * 0.6);
    path2.quadraticBezierTo(
        size.width * 0.4, size.height * 0.7,
        size.width, size.height
    );
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}