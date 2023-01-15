import 'package:flutter/material.dart';

import '../color/colors.dart';

class FieldContent extends StatelessWidget {
  FieldContent({
    Key? key,
    required this.icon,
    required this.hintText,
  }) : super(key: key);
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: blueGrotto.withOpacity(0.4),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          letterSpacing: 1,
          color: black1,
          fontWeight: FontWeight.w300,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueGrotto, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueGrotto, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
