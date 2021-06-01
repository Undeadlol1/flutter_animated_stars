import 'package:flutter/material.dart';

class StarsPainter extends CustomPainter {
  late Size _size;
  late Canvas _canvas;
  final Paint _starPaint = Paint()..color = Colors.white;

  double starPosition = 0.0;
  StarsPainter({required this.starPosition});

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;
    _canvas = canvas;

    _trimAndColorCanvas();
    _drawCanvasBorders();
    _drawCrossSection();
    _drawMultipleStars();
  }

  void _drawMultipleStars() {
    final verticalMiddle = (_size.height / 2);
    final horizontalCenter = (_size.width / 2);

    for (var i = 0; i < 10; i++) {
      final additionalVerticalPosition =
          (starPosition * (i.isEven ? -1 : 1)) * (i.isOdd ? 1 : -1);
      final additionalHorizontalPosition = (starPosition * (i.isEven ? -1 : 1));
      drawAStar(
        verticalPosition: verticalMiddle + additionalVerticalPosition,
        horizontalPositon: horizontalCenter + additionalHorizontalPosition,
      );
    }

    drawAStar(
      verticalPosition: verticalMiddle + (starPosition * 1 * -1),
      horizontalPositon: horizontalCenter + (starPosition * 1 * -1),
    );
    drawAStar(
      verticalPosition: verticalMiddle + (starPosition * 1 * -1),
      horizontalPositon: horizontalCenter + (starPosition * 1 * 1),
    );
  }

  void _drawCrossSection() {
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
    _drawStarTail(
      size: _size,
      canvas: _canvas,
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
    final double marginBetweenHeadAndTail = 10;

    for (var i = 0; i < 100; i++) {
      canvas.drawCircle(
        Offset(
          horizontalPositon - marginBetweenHeadAndTail - (1 * i),
          verticalPosition - marginBetweenHeadAndTail,
        ),
        1,
        _starPaint,
      );
    }
  }

  void _trimAndColorCanvas() {
    _canvas.clipRect(
      Rect.fromPoints(
        Offset(0, 0),
        Offset(_size.width, _size.height),
      ),
    );
    _canvas.drawColor(Colors.black, BlendMode.clear);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO or should it be false?
    return true;
  }
}
