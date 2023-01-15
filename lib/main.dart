import 'package:flutter/material.dart';
import 'package:shopping_centre/presentation/page/registration/login_page.dart';
import 'package:shopping_centre/presentation/page/screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
