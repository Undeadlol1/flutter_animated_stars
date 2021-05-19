import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/stars_painter.dart';

class StarsExperiment extends StatefulWidget {
  const StarsExperiment({Key? key}) : super(key: key);

  @override
  _StarsExperimentState createState() => _StarsExperimentState();
}

class _StarsExperimentState extends State<StarsExperiment>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _movementTween = Tween(begin: 0, end: 100);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
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

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // debugPrint('screen width: $width');
    // debugPrint('screen height: $height');

    return CustomPaint(
      child: SizedBox(
        height: 250,
        width: width,
      ),
      painter: StarsPainter(
        starPosition: animation.value,
      ),
    );
  }
}
