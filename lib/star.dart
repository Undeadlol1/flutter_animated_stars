import 'dart:ui';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Star extends StatelessWidget {
  final double angle;
  final bool isTailVisible;
  final double animationProgressInPercentages;
  Star({
    Key? key,
    this.angle = 0,
    this.isTailVisible = true,
    this.animationProgressInPercentages = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radians = angle * Math.pi / 360;
    return Transform.rotate(
      angle: radians,
      child: Transform.translate(
        offset: Offset(0, animationProgressInPercentages),
        child: CustomPaint(
          painter: _StarPainter(isTailVisible: isTailVisible),
        ),
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  late Size _size;
  late Canvas _canvas;

  bool isTailVisible;
  _StarPainter({this.isTailVisible = true});

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;
    _canvas = canvas;

    _drawStarHead();
    if (isTailVisible) _drawStarTail();
  }

  void _drawStarHead() {
    _canvas.drawCircle(
      Offset(_size.width / 2, _size.height / 2),
      1.5,
      Paint()..color = Colors.white,
    );
  }

  void _drawStarTail() {
    final pointPaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.white24;
    _canvas.drawPoints(
      PointMode.points,
      _generateTriangularLineOfPoints(),
      pointPaint,
    );
  }

  List<Offset> _generateTriangularLineOfPoints() {
    final List<Offset> pointLocations = [];
    final verticalCenter = _size.height / 2;
    final horizontalCenter = _size.width / 2;

    for (var positionInLine = 0; positionInLine < 10; positionInLine++) {
      var howManyPointsShouldBeInThisSection = positionInLine * 0.4;
      for (var i = 0; i < howManyPointsShouldBeInThisSection; i++) {
        pointLocations.add(Offset(
          horizontalCenter + (i * 5) * (i.isEven ? -1 : 1),
          verticalCenter - (14 + positionInLine * 5),
        ));
      }
    }

    return pointLocations;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
