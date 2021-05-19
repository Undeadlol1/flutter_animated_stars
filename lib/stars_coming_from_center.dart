import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/star.dart';

class StarsComingFromCenter extends StatefulWidget {
  const StarsComingFromCenter({Key? key}) : super(key: key);

  @override
  _StarsComingFromCenterState createState() => _StarsComingFromCenterState();
}

class _StarsComingFromCenterState extends State<StarsComingFromCenter>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0, end: 12).animate(controller)
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
    final double height = 200;
    return Container(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 200,
            left: height / 2,
            child: Star(angle: animation.value),
          ),
          Positioned(
            width: 200,
            left: height / 2,
            child: Star(angle: 100),
          ),
          Positioned(
            width: 200,
            left: height / 2,
            child: Star(angle: 180),
          )
        ],
      ),
      color: Colors.black,
      width: double.infinity,
    );
  }
}
