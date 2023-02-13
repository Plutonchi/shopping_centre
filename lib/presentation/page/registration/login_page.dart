import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_centre/presentation/page/registration/register_constans_widget/register_password_widget.dart';
import 'package:shopping_centre/presentation/page/registration/signin_page.dart';
import 'package:shopping_centre/utils/theme/utils.dart';
import '../../../controller/authController.dart';
import '../../../utils/color/colors.dart';
import '../../../utils/widgets/field_content.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  RxBool isLoginWidgetDisplayed = true.obs;

  changeDIsplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    UserController userController = UserController.instance;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      color: color,
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
                        color: color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FieldContent(
                        controller: userController.email,
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
                        color: color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RegisterPasswordWidget(),
                    // FieldContent(
                    //     controller: userController.password,
                    //     obscureText: true,
                    //     hintText: "Введите ваш пароль",
                    //     icon: Icons.lock_outline),
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
                                color: color,
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
                            userController.signIn();
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
                                color: color,
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
                        color: color,
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
    );
  }
}
