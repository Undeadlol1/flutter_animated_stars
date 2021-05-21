import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/star.dart';

class StarsComingFromCenter extends StatefulWidget {
  const StarsComingFromCenter({Key? key}) : super(key: key);

  @override
  _StarsComingFromCenterState createState() => _StarsComingFromCenterState();
}

class _StarsComingFromCenterState extends State<StarsComingFromCenter>
    with SingleTickerProviderStateMixin {
  final double starWidth = 200;
  final double containerHeight = 200;

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
      ..addStatusListener(_repeatAnimationWhenCompleted);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: containerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildAnimatedStar(angle: 30),
          _buildAnimatedStar(angle: 100),
          _buildAnimatedStar(angle: 180),
        ],
      ),
    );
  }

  Widget _buildAnimatedStar({required double angle}) {
    return AnimatedPositioned(
      width: starWidth,
      top: containerHeight / 2,
      left: containerHeight / 2,
      duration: Duration(seconds: 3),
      child: Star(
        angle: angle,
        animationValue: animation.value,
      ),
    );
  }

  void _repeatAnimationWhenCompleted(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.repeat();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }
}
