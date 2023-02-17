// ignore_for_file: camel_case_types

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/utils/widgets/text_description_widget.dart';
import '../../../presentation/model/products_model.dart';
import '../../presentation/page/details/product_details.dart';
import '../theme/utils.dart';

class onSaleWidgets extends StatefulWidget {
  const onSaleWidgets({
    super.key,
  });

  @override
  State<onSaleWidgets> createState() => _onSaleWidgetsState();
}

class _onSaleWidgetsState extends State<onSaleWidgets> {
  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);
    final Color color = Utils(context).color;
    Size size = Utils(context).screensize;
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: ProductDetails(
                id: productsModelProvider.id.toString(),
              ),
              type: PageTransitionType.fade,
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      child: FancyShimmerImage(
                        imageUrl: productsModelProvider.images![0],
                        width: size.width * 0.30,
                        height: size.width * 0.30,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidgets(
                  text: productsModelProvider.title.toString(),
                  color: color,
                  size: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
