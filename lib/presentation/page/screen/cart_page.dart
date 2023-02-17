// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shopping_centre/utils/theme/utils.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Size size = Utils(context).screensize;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card Screen",
          style: TextStyle(color: color),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
