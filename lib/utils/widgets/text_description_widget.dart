// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';

class TextWidgets extends StatelessWidget {
  TextWidgets({
    super.key,
    this.text,
    required this.color,
    required this.size,
    this.isTitle = false,
  });
  final String? text;
  final Color color;
  final double size;
  bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
