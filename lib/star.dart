import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/stars_painter.dart';

class Star extends StatefulWidget {
  const Star({Key key}) : super(key: key);

  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
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
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: SizedBox(
        width: 500,
        height: 500,
      ),
      painter: StarsPainter(
        starPosition: animation.value,
      ),
    );
  }
}
