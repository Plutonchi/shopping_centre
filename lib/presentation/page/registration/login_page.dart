import 'package:flutter/material.dart';
import 'package:shopping_centre/utils/app_constants/color/colors.dart';

import '../../../utils/app_constants/widgets/field_content.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontFamily: "Abhaya",
            fontSize: 32,
            color: white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email ID",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              FieldContent(
                  hintText: "Enter your email id", icon: Icons.email_outlined),
              Text(
                "Password",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              FieldContent(
                  hintText: "Enter your password", icon: Icons.lock_outline),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("Forgot password?"),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
