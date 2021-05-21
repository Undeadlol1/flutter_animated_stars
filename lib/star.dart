import 'dart:math' as Math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Star extends StatelessWidget {
  final double angle;
  // TODO rename
  final double animationValue;
  Star({
    Key? key,
    this.angle = 0,
    this.animationValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final degrees = 15;
    final radians = angle * Math.pi / 180;
    return Transform.translate(
      offset: _getOffset(),
      child: Transform.rotate(
        angle: radians,
        child: CustomPaint(
          painter: _StarPainter(starPosition: 0),
        ),
      ),
    );
  }

  Offset _getOffset() {
    Offset center = Offset(animationValue, animationValue);

    // TODO remove "200"
    double x = 200 * Math.cos(angle) + center.dx;
    double y = 200 * Math.sin(angle) + center.dy;

    // return Offset(x, y);
    return Offset(0, 0);
  }
}

class _StarPainter extends CustomPainter {
  late Size _size;
  late Canvas _canvas;
  double starPosition = 0.0;
  Paint _whitePaint = Paint()..color = Colors.white;

  _StarPainter({required this.starPosition});

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
        Offset(_size.width / 2 - (14 + i * 5), _size.height / 2),
        1,
        _whitePaint,
      );
    }
  }

  void _trimAndPaintCanvas() {
    final paddingBetweenStarAndCanvasEdge = 5;
    _canvas.clipRect(
      Rect.fromPoints(
        Offset(0, _size.height / 2 - paddingBetweenStarAndCanvasEdge),
        Offset(_size.width, _size.height / 2 + paddingBetweenStarAndCanvasEdge),
      ),
    );
    _canvas.drawPaint(Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
