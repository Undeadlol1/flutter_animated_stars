import 'package:flutter/material.dart';

Paint _starPaint = Paint()..color = Colors.white;

class StarsPainter extends CustomPainter {
  double starPosition = 0.0;

  late Size _size;
  late Canvas _canvas;

  StarsPainter({required this.starPosition});

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;
    _canvas = canvas;
    canvas.clipRect(
      Rect.fromPoints(
        Offset(0, 0),
        Offset(size.width, size.height),
      ),
    );
    canvas.drawColor(Colors.black, BlendMode.clear);
    _drawCanvasBorders();
    _drawCrossSection();

    for (var i = 0; i < 1; i++) {
      drawAStar(
        horizontalPositon: (size.width / 2) + i,
        verticalPosition: (size.height / 2) + i,
      );
    }
  }

  void _drawCrossSection() {
    debugPrint('size.width: ${_size.width}');
    debugPrint('size.height: ${_size.height}');
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.deepPurple;

    _canvas.drawLine(
      Offset(0, 0),
      Offset(_size.width, _size.height),
      paint,
    );
    _canvas.drawLine(
      Offset(_size.width, 0),
      Offset(0, _size.height),
      paint,
    );
  }

  void _drawCanvasBorders() {
    var paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple;

    _canvas.drawLine(
      Offset(0, 0),
      Offset(_size.width, 0),
      paint,
    );
    _canvas.drawLine(
      Offset(_size.width, 0),
      Offset(_size.width, _size.height),
      paint,
    );
    _canvas.drawLine(
      Offset(0, 0),
      Offset(0, _size.height),
      paint,
    );
    _canvas.drawLine(
      Offset(0, _size.height),
      Offset(_size.width, _size.height),
      paint,
    );
  }

  void drawAStar({
    required double horizontalPositon,
    required double verticalPosition,
  }) {
    _drawStarHead(
      size: _size,
      canvas: _canvas,
      position: Offset(horizontalPositon, verticalPosition),
    );
    // _drawStarTail(
    //   size: size,
    //   canvas: canvas,
    //   verticalPosition: verticalPosition,
    //   horizontalPositon: horizontalPositon,
    // );
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
