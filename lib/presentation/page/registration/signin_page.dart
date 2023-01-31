import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_centre/controller/controllers.dart';
import 'package:shopping_centre/presentation/page/registration/login_page.dart';
import 'package:shopping_centre/controller/authController.dart';
import 'package:shopping_centre/utils/theme/utils.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/widgets/field_content.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserController userController = UserController.instance;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => Visibility(
          visible: appController.isLoginWidgetDisplayed.value,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Регистрация",
                      style: TextStyle(
                          fontFamily: "Abhaya",
                          fontSize: 32,
                          color: color,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Имя",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FieldContent(
                            controller: userController.name,
                            obscureText: false,
                            hintText: "Напишите свое имя",
                            icon: Icons.person),
                        const SizedBox(height: 24),
                        Text(
                          "Адрес электронной почты",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FieldContent(
                            controller: userController.email,
                            obscureText: false,
                            hintText: "Введите свой адрес электронной почты",
                            icon: Icons.email_outlined),
                        SizedBox(height: 24),
                        Text(
                          "Пароль",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FieldContent(
                            controller: userController.password,
                            obscureText: true,
                            hintText: "Введите ваш пароль",
                            icon: Icons.lock_outline),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                userController.signUp();
                              },
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
                                    color: color,
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
                            color: color,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn()));
                          },
                          child: Text(
                            "Вход",
                            style: TextStyle(
                              fontFamily: "Abhaya",
                              fontSize: 16,
                              letterSpacing: 1,
                              color: color,
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
        ),
      ),
    );
  }
}
