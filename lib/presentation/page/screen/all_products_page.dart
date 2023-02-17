import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/service/api_handler.dart';
import '../../../utils/theme/utils.dart';
import '../../../utils/widgets/product_widgets.dart';
import '../../model/products_model.dart';

class Feeds extends StatefulWidget {
  const Feeds({
    super.key,
  });

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productList = [];
  int limit = 10;
  bool _isLoading = false;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        limit += 10;
        if (limit == 30) {
          _isLoading = true;
          setState(() {});
          return;
        }
        await getProducts();
        // _isLoading = true;
      }
    });
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProducts(
      limit: limit.toString(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: color,
        ),
        title: Text(
          "Все товары",
          style: TextStyle(
            color: color,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: productList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 4,
                          childAspectRatio: 110 / 130,
                        ),
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                            value: productList[index],
                            child: const onSaleWidgets(),
                          );
                        }),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
    );
  }
}
