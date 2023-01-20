import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/provider/dark_theme_provider.dart';
import 'package:shopping_centre/services/dark_theme_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text('Theme'),
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
      ),
    );
  }
}
