import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Tween<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animation = Tween<double>(begin: 0.8, end: 0);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AnimatedBuilder(
            builder: (context,child) => CustomPaint(
              painter: PackManPainter(
                mouthExtend: animationController.value,
              ),
            ), animation: animation.animate(animationController),
          ),
        )

    );
  }
}


class PackManPainter extends CustomPainter {

  final double mouthExtend;

  const PackManPainter({
    super.repaint,
    required this.mouthExtend,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(-5, -50),36, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(-23, -50),3.5, Paint()..color = Colors.indigo);
    canvas.drawCircle(const Offset(13, -50),3.5, Paint()..color = Colors.indigo);
    canvas.drawCircle(const Offset(-5, 30),50, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(-5, 27),3.5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(-5, 135),70, Paint()..color = Colors.lightBlueAccent);
    canvas.drawCircle(const Offset(-5, 107),3.5, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(-5, 149),3.5, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}