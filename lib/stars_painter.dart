import 'package:flutter/material.dart';

Paint _starPaint = Paint()..color = Colors.white;

class StarsPainter extends CustomPainter {
  double starPosition = 0.0;

  StarsPainter({required this.starPosition});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(
      Rect.fromCenter(
        width: size.width,
        height: size.height,
        center: Offset(0, 0),
      ),
    );
    canvas.drawColor(Colors.black, BlendMode.clear);

    for (var i = 0; i < 10; i++) {
      drawAStar(
        size: size,
        canvas: canvas,
        horizontalPositon: (size.width / 2),
        verticalPosition: size.height / 2 + (i * 13),
      );
    }
  }

  void drawAStar({
    required Size size,
    required Canvas canvas,
    required double horizontalPositon,
    required double verticalPosition,
  }) {
    _drawStarHead(
      size: size,
      canvas: canvas,
      position: Offset(horizontalPositon, verticalPosition),
    );
    _drawStarTail(
      size: size,
      canvas: canvas,
      verticalPosition: verticalPosition,
      horizontalPositon: horizontalPositon,
    );
  }

  void _drawStarHead({
    required Size size,
    required Canvas canvas,
    required Offset position,
  }) {
    canvas.drawCircle(
      position,
      2,
      _starPaint,
    );
  }

  void _drawStarTail({
    required Size size,
    required Canvas canvas,
    required double verticalPosition,
    required double horizontalPositon,
  }) {
    final color = _starPaint;
    final double marginBetweenHeadAndTail = 10;

    for (var i = 0; i < 100; i++) {
      canvas.drawCircle(
        Offset(
          horizontalPositon - marginBetweenHeadAndTail - (1 * i),
          verticalPosition,
        ),
        1,
        color,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
