import 'package:flutter/material.dart';

class CurvePainter_1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
    paint.color = Color.fromARGB(180,253,139,25);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.07);
    path.quadraticBezierTo(size.width * 0.38, size.height * 0.28,
        size.width *1, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


/* For reference, If needed...
var path = Path();
    path.moveTo(0, size.height * 0.375);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.15,
        size.width * 0.55, size.height * 0.175);
    path.quadraticBezierTo(size.width * 0.835, size.height * 0.2,
        size.width * 1, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    */