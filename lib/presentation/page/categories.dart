import 'package:flutter/material.dart';
import 'package:shopping_centre/utils/app_constants/theme/utils.dart';
import 'package:shopping_centre/utils/app_constants/widgets/catigories_widget.dart';
import 'package:shopping_centre/utils/app_constants/widgets/text_widgets.dart';

class CatigoriesScreen extends StatelessWidget {
  CatigoriesScreen({super.key});
  final List<Map<String, dynamic>> _catInfo = [
    {
      'imgPath': 'assets/images/categories_image/beautifuly.png',
      'catText': 'Украшения '
    },
    {
      'imgPath': 'assets/images/categories_image/accsesories.png',
      'catText': 'Украшения и аксессуары'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidgets(
          text: "Categories",
          color: color,
          size: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 220 / 360,
          crossAxisSpacing: 8,
          mainAxisSpacing: 5,
          children: [
            ...List.generate(
              2,
              (index) {
                return CategoriesWidget(
                    catText: _catInfo[index]['catText'],
                    color: color,
                    imgPath: _catInfo[index]['imgPath']);
              },
            ),
          ],
        ),
      ),
    );
  }
}
