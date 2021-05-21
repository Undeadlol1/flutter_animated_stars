import 'dart:ui';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Star extends StatelessWidget {
  final double angle;
  // TODO rename
  final double animationValueInPercentages;
  Star({
    Key? key,
    this.angle = 0,
    this.animationValueInPercentages = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radians = angle * Math.pi / 360;
    return Transform.rotate(
      angle: radians,
      child: Transform.translate(
        offset: _getOffset(),
        child: CustomPaint(
          painter: _StarPainter(),
        ),
      ),
    );
  }

  Offset _getOffset() {
    return Offset(0, animationValueInPercentages);
  }
}

class _StarPainter extends CustomPainter {
  late Size _size;
  late Canvas _canvas;
  Paint _whitePaint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;
    _canvas = canvas;

    _trimAndPaintCanvas();
    _drawStarHead();
    _drawStarTail();
  }

  void _drawStarHead() {
    _canvas.drawCircle(
      Offset(_size.width / 2, _size.height / 2),
      2,
      _whitePaint,
    );
  }

  void _drawStarTail() {
    // _canvas.drawPoints(PointMode.points, [Offset(0, 1)], _whitePaint);
    for (var i = 0; i < 10; i++) {
      _canvas.drawCircle(
        Offset(_size.width / 2, _size.height / 2 - (14 + i * 5)),
        1,
        _whitePaint,
      );
    }
  }

  void _trimAndPaintCanvas() {
    final canvasPadding = 5;
    _canvas.clipRect(
      Rect.fromPoints(
        Offset((_size.width / 2) + canvasPadding, 0.0),
        Offset((_size.width / 2) - canvasPadding, _size.width),
      ),
    );
    _canvas.drawPaint(Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
