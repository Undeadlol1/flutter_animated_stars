import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/stars_painter.dart';

class Star extends StatefulWidget {
  const Star({Key? key}) : super(key: key);

  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _movementTween = Tween(begin: -Math.pi, end: Math.pi);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    animation = _movementTween.animate(controller)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        debugPrint('status: $status');
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint('screen width: ${width}');
    debugPrint('screen height: ${height}');

    return CustomPaint(
      child: SizedBox(
        width: width,
        height: 250,
      ),
      painter: StarsPainter(
        starPosition: animation.value,
      ),
    );
  }
}
