import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class TextWidgets extends StatelessWidget {
  TextWidgets({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    this.isTitle = false,
    this.maxLine = 10,
  });
  final String text;
  final Color color;
  final double size;
  bool isTitle;
  int maxLine = 10;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: size,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
