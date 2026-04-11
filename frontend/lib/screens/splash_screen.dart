import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: BackgroundPainter())),
          Center(
            child: Text(
              'GREENBIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: R.fs(context, 42),
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

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF2196F3);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    final path1 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..quadraticBezierTo(
          size.width * 0.6, size.height * 0.3, size.width, size.height * 0.45)
      ..lineTo(size.width, 0)
      ..close();
    paint.color = Colors.white.withOpacity(0.1);
    canvas.drawPath(path1, paint);

    final path2 = Path()
      ..moveTo(0, size.height * 0.6)
      ..quadraticBezierTo(
          size.width * 0.4, size.height * 0.7, size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}