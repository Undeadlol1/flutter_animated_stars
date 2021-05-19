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
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween<double>(begin: 0, end: 100).animate(animationController)
      ..addListener(() => setState(() => {}))
      ..addStatusListener((status) {
        debugPrint('status: $status');
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
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
            child: Star(
              angle: 180,
              animationValue: animation.value,
            ),
          ),
          Positioned(
            width: 100,
            left: height / 2,
            child: Star(angle: 100),
          ),
          Positioned(
            width: 200,
            left: height / 2,
            child: Star(angle: 30),
          )
        ],
      ),
      color: Colors.black,
      width: double.infinity,
    );
  }
}
