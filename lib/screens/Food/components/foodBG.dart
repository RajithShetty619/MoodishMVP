import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
    paint.color = Colors.blue[200];
    paint.style = PaintingStyle.fill;

    var path = Path();
    // TODO: Draw your path
    path.moveTo(0, size.height * 0.375);
    path.quadraticBezierTo(
        size.width * 0.4, size.height * 0.6, size.width * 0.65, size.height * 0.375);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.2, size.width * 1, size.height * 0.375);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}