import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/utils/widgets/text_widgets.dart';
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
    Size size = Utils(context).Screensize;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.6),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    child: FancyShimmerImage(
                      imageUrl: productsModelProvider.images![0],
                      width: size.width * 0.30,
                      height: size.width * 0.30,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              TextWidgets(
                text: productsModelProvider.title.toString(),
                color: color,
                size: 17,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
