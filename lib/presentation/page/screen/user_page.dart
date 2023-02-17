import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/controller/controllers.dart';
import '../../../theme_provider/dark_theme_provider.dart';
import '../../../utils/widgets/text_description_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Добро Пожаловать,   ",
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "123",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidgets(
                  text: "sss",
                  color: color,
                  size: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: "Адрес",
                  color: color,
                  subtitle: "Подзаголовок",
                  onPressed: () {},
                  icon: IconlyLight.location,
                ),
                _listTiles(
                  color: color,
                  title: "Заказы",
                  onPressed: () {},
                  icon: IconlyLight.bag_2,
                ),
                _listTiles(
                  color: color,
                  title: "Избранное",
                  onPressed: () {},
                  icon: IconlyLight.heart,
                ),
                _listTiles(
                  color: color,
                  title: "Личные данные",
                  icon: IconlyLight.setting,
                  onPressed: () {},
                ),
                _listTiles(
                  color: color,
                  title: "Выйти из аккаунта",
                  icon: IconlyLight.logout,
                  onPressed: () {
                    showDiologLogOut();
                  },
                ),
                SwitchListTile(
                  title: TextWidgets(
                    text: themeState.getDarkTheme
                        ? "Темный режим"
                        : "Светлый режим",  
                    color: color,
                    isTitle: true,
                    size: 22,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showDiologLogOut() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: const [
                Text("Выйти"),
              ],
            ),
            content: const Text(
              "Вы уверены, что хотите выйти?",
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text("Отмена"),
              ),
              TextButton(
                onPressed: () {
                  userController.signOut();
                },
                child: const Text("Ок"),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Color color,
    required void Function() onPressed,
  }) {
    return ListTile(
      title: TextWidgets(
        text: title,
        color: color,
        isTitle: true,
        size: 22,
      ),
      subtitle: TextWidgets(
        color: color,
        text: subtitle ?? "",
        size: 18,
      ),
      leading: Icon(
        icon,
      ),
      trailing: const Icon(
        IconlyLight.arrow_right_2,
      ),
      onTap: onPressed,
    );
  }
}
