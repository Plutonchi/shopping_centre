import 'package:flutter/material.dart';

import '../color/colors.dart';

class FieldContent extends StatefulWidget {
  FieldContent({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.suffixIcons,
  }) : super(key: key);
  bool obscureText = false;
  final IconData icon;
  final String hintText;
  final IconData? suffixIcon;
  final IconData? suffixIcons;
  @override
  State<FieldContent> createState() => _FieldContentState();
}

class _FieldContentState extends State<FieldContent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          child: Icon(
            widget.obscureText ? widget.suffixIcon : widget.suffixIcons,
            color: Colors.grey,
          ),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: blueGrotto.withOpacity(0.4),
        ),
        hintText: widget.hintText,
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
