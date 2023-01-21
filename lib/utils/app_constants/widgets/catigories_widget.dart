import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/utils/app_constants/widgets/text_widgets.dart';

import '../../../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.color});

  final String catText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print("Category pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidgets(
              text: catText,
              color: color,
              size: 13.5,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
