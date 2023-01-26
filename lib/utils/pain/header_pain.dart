import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class bottomUi extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7377621);
    path_0.lineTo(0, 0);
    path_0.cubicTo(
        0,
        size.height * 0.09486019,
        size.width * 0.07593583,
        size.height * 0.1704675,
        size.width * 0.1026550,
        size.height * 0.1921529);
    path_0.cubicTo(
        size.width * 0.1330181,
        size.height * 0.2167956,
        size.width * 0.7113556,
        size.height * 0.4791655,
        size.width * 0.8183500,
        size.height * 0.5278107);
    path_0.cubicTo(
        size.width * 0.9248278,
        size.height * 0.5762233,
        size.width * 0.9439556,
        size.height * 0.6920874,
        size.width * 0.9583861,
        size.height * 0.7795049);
    path_0.lineTo(size.width * 0.9585972, size.height * 0.7807718);
    path_0.cubicTo(
        size.width * 0.9730556,
        size.height * 0.8683350,
        size.width * 0.9224500,
        size.height * 0.9437379,
        size.width * 0.8761833,
        size.height * 0.9777913);
    path_0.cubicTo(
        size.width * 0.8299167,
        size.height * 1.011840,
        size.width * 0.2559150,
        size.height * 0.9972476,
        size.width * 0.1416931,
        size.height * 0.9948155);
    path_0.cubicTo(
        size.width * 0.05430611,
        size.height * 0.9929563,
        size.width * 0.01284764,
        size.height * 0.8441262,
        size.width * 0.001384294,
        size.height * 0.7602184);
    path_0.cubicTo(size.width * 0.0003778611, size.height * 0.7528544, 0,
        size.height * 0.7453398, 0, size.height * 0.7377621);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF4D1A1).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1830103, size.height * 0.4999515);
    path_1.cubicTo(
        size.width * 0.06100333,
        size.height * 0.5376456,
        size.width * 0.01016725,
        size.height * 0.4353869,
        0,
        size.height * 0.3795466);
    path_1.lineTo(0, size.height * 0.4711592);
    path_1.lineTo(0, size.height * 0.7931117);
    path_1.cubicTo(0, size.height * 0.9899466, size.width * 0.1220069,
        size.height * 1.047879, size.width * 0.1830103, size.height * 1.052243);
    path_1.cubicTo(
        size.width * 0.3573778,
        size.height * 1.053117,
        size.width * 0.7357028,
        size.height * 1.054335,
        size.width * 0.8540472,
        size.height * 1.052243);
    path_1.cubicTo(
        size.width * 1.001628,
        size.height * 1.049631,
        size.width * 1.032336,
        size.height * 0.8255971,
        size.width * 1.038539,
        size.height * 0.7803447);
    path_1.lineTo(size.width * 1.038583, size.height * 0.7800243);
    path_1.cubicTo(
        size.width * 1.044683,
        size.height * 0.7355243,
        size.width * 1.040108,
        size.height * 0.7276748,
        size.width * 1.038583,
        size.height * 0.4711592);
    path_1.cubicTo(
        size.width * 1.037364,
        size.height * 0.2659476,
        size.width * 0.8855667,
        size.height * 0.2774646,
        size.width * 0.8098194,
        size.height * 0.3088748);
    path_1.cubicTo(
        size.width * 0.6517194,
        size.height * 0.3568617,
        size.width * 0.3050167,
        size.height * 0.4622597,
        size.width * 0.1830103,
        size.height * 0.4999515);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5208333, size.height * 0.2912621),
        Offset(size.width * 0.5208333, size.height * 1.053398),
        [Color(0xffF4D1A1).withOpacity(1), Color(0xffF3A940).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
