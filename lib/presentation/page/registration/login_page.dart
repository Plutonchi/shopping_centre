import 'package:flutter/material.dart';
import 'package:shopping_centre/utils/app_constants/color/colors.dart';

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
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: blueGrotto.withOpacity(0.4),
                  ),
                  hintText: "Enter your email id",
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGrotto, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
