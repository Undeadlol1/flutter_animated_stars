import 'package:flutter/material.dart';
import 'package:flutter_animated_stars/star.dart';

class StarsComingFromCenter extends StatelessWidget {
  const StarsComingFromCenter({Key? key}) : super(key: key);

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
            child: Star(angle: 200),
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
