import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../utils/color/colors.dart';
import '../../../../utils/theme/utils.dart';

class RegisterPasswordWidget extends StatefulWidget {
  RegisterPasswordWidget({
    Key? key,
  }) : super(key: key);
  bool obscureText = false;
  // final IconData icon;
  // final String hintText;
  // final IconData? suffixIcon;
  // final IconData? suffixIcons;
  String? password;
  bool isVisible = true;
  TextEditingController? controller = TextEditingController();
  @override
  _RegisterPasswordWidgetState createState() => _RegisterPasswordWidgetState();
}

class _RegisterPasswordWidgetState extends State<RegisterPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {}
      },
      onChanged: (value) {
        widget.password = value;
        log(widget.password!);
      },
      controller: widget.controller,
      obscureText: widget.isVisible,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(
            widget.isVisible == true
                ? Icons.key_off_outlined
                : Icons.key_outlined,
            color: blueg,
          ),
          onPressed: () {
            setState(() {
              widget.isVisible = !widget.isVisible;
            });
          },
        ),
        hintText: "Введите ваш пароль",
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          letterSpacing: 1,
          color: color,
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
