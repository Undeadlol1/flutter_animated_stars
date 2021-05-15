import 'dart:math';
import 'package:flutter/material.dart';

Paint _starPaint = Paint()..color = Colors.white;

class StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.black, BlendMode.clear);
    _drawStarHead(canvas, size);
    _drawStarTail(canvas, size);
  }

  void _drawStarHead(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 3, _starPaint);
  }

  void _drawStarTail(Canvas canvas, Size size) {
    final color = _starPaint;
    final horizontalCenter = size.width / 2;
    final verticallyCenter = size.height / 2;

    for (var i = 0; i < 25; i++) {
      canvas.drawCircle(
        Offset(
          horizontalCenter - Random().nextInt(100),
          verticallyCenter +
              (Random().nextBool() ? 1 : -1) * Random().nextInt(5),
        ),
        1,
        color,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
