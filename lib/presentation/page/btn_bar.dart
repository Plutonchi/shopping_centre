import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/presentation/page/cart.dart';
import 'package:shopping_centre/presentation/page/categories.dart';
import 'package:shopping_centre/presentation/page/home_page.dart';
import 'package:shopping_centre/presentation/page/user.dart';
import 'package:shopping_centre/provider/dark_theme_provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomePage(), 'title': 'Home Screen'},
    {'page': CatigoriesScreen(), 'title': 'Catigories Screen'},
    {'page':  CardScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;

    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: _isDark ? Colors.blue : Colors.black,
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.orange,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Категории",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
            ),
            label: "Оплата",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user_2 : IconlyLight.user),
            label: "Пользователь",
          ),
        ],
      ),
    );
  }
}
