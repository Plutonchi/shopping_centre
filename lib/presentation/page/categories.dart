import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/data/service/api_handler.dart';
import 'package:shopping_centre/presentation/model/catigories.dart';

import '../../utils/theme/utils.dart';
import '../../utils/widgets/catigories_widget.dart';
import '../../utils/widgets/text_widgets.dart';

class CatigoriesScreen extends StatelessWidget {
  const CatigoriesScreen({super.key});

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
      body: FutureBuilder<List<CategoriesModel>>(
          future: APIHandler.getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              Center(
                child: Text("Произошла ошибка ${snapshot.error}"),
              );
            } else if (snapshot.data == null) {
              const Center(
                child: Text("Еще не добавлено ни одного продукта"),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 220 / 360,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: const CategoryWidget());
              },
            );
          }),
    );
  }
}
