import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_centre/presentation/page/home_page.dart';
import 'package:shopping_centre/presentation/page/registration/signin_page.dart';
import 'package:shopping_centre/utils/pain/header_pain.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/widgets/field_content.dart';
import '../btn_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Войти",
                  style: TextStyle(
                      fontFamily: "Abhaya",
                      fontSize: 32,
                      color: black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 140,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Адрес электронной почты",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldContent(
                        obscureText: false,
                        hintText: "Введите свой адрес электронной почты",
                        icon: Icons.email_outlined),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Пароль",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldContent(
                        obscureText: true,
                        hintText: "Введите ваш пароль",
                        icon: Icons.lock_outline),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Забыли пароль?",
                            style: TextStyle(
                                color: black,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Center(
                      child: Container(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                child: const BottomBar(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueGrotto,
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Войти",
                            style: TextStyle(
                                fontFamily: "Abhaya",
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Вы новый \nПользователь?",
                      style: TextStyle(
                        fontFamily: "Abhaya",
                        fontSize: 14,
                        letterSpacing: 1,
                        color: black1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "Регистрация",
                        style: TextStyle(
                          fontFamily: "Abhaya",
                          fontSize: 14,
                          letterSpacing: 1,
                          color: black1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
