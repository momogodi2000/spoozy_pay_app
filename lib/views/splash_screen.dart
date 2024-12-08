// lib/views/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start animation
    _controller.forward();

    // Initialize app with context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().initializeApp(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    final logoSize = shortestSide * 0.3;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4169E1),  // Royal Blue
              Color(0xFF1E90FF),  // Dodger Blue
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: logoSize,
                  height: logoSize,
                  child: CustomPaint(
                    painter: LogoPainter(),
                  ),
                ),
                SizedBox(height: shortestSide * 0.02),
                Text(
                  'Spoozy Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: shortestSide * 0.06,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.2)
      ..lineTo(size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height * 0.6)
      ..lineTo(size.width * 0.6, size.height * 0.6)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..lineTo(size.width * 0.2, size.height * 0.4)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}