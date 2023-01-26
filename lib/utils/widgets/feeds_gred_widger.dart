import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/model/products_model.dart';
import 'on_sale_widgets.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList})
      : super(key: key);
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 4,
              childAspectRatio: 110 / 140),
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: const onSaleWidgets(),
            );
          }),
    );
  }
}
