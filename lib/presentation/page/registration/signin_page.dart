import 'package:flutter/material.dart';
import 'package:shopping_centre/presentation/page/registration/login_page.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/widgets/field_content.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  height: 28,
                ),
                Text(
                  "Регистрация",
                  style: TextStyle(
                      fontFamily: "Abhaya",
                      fontSize: 32,
                      color: black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 24),
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
                      height: 16,
                    ),
                    Text(
                      "Подтвердить Пароль",
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
                        hintText: "Подтвердить Пароль",
                        icon: Icons.lock_outline),
                    SizedBox(height: 32),
                    Center(
                      child: Container(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueGrotto,
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Зарегистрироваться",
                            style: TextStyle(
                                fontFamily: "Abhaya",
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "У вас есть аккаунт?",
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
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "Вход",
                        style: TextStyle(
                          fontFamily: "Abhaya",
                          fontSize: 16,
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
