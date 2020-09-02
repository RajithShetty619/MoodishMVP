import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
<<<<<<< HEAD
    paint.color = Colors.orange[400];
=======
    paint.color = Color.fromARGB(255,253,139,25);
>>>>>>> 764199d945217e4f64558d8ed9591d27112e4fef
    paint.style = PaintingStyle.fill;

    var path = Path();
    // TODO: Draw your path
    path.moveTo(0, size.height * 0.375);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.15, size.width * 0.55, size.height * 0.175);
    path.quadraticBezierTo(
        size.width * 0.835, size.height * 0.2, size.width * 1, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}