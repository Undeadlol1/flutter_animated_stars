import 'package:flutter/material.dart';

Paint _starPaint = Paint()..color = Colors.white;

class StarsPainter extends CustomPainter {
  double starPosition = 0.0;

  StarsPainter({required this.starPosition});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(
      Rect.fromPoints(
        Offset(0, 0),
        Offset(size.width, size.height),
      ),
    );
    canvas.drawColor(Colors.black, BlendMode.clear);
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      100,
      Paint()..color = Colors.red,
    );
    _drawCanvasBorders(canvas, size);
    _drawCrossSection(canvas, size);
    // for (var i = 0; i < 10; i++) {
    //   drawAStar(
    //     size: size,
    //     canvas: canvas,
    //     horizontalPositon: (size.width / 4),
    //     verticalPosition: (size.height / 8) + (i * 13),
    //   );
    // }
  }

  void _drawCrossSection(Canvas canvas, Size size) {
    debugPrint('size.width: ${size.width}');
    debugPrint('size.height: ${size.height}');
    var paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.deepPurple;

    canvas.drawCircle(
      Offset(size.width, 0),
      20,
      _starPaint,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      paint,
    );
  }

  void _drawCanvasBorders(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple;

    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
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
