import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_centre/data/service/api_handler.dart';
import 'package:shopping_centre/presentation/model/products_model.dart';
import 'package:shopping_centre/presentation/page/feeds_page.dart';

import '../../utils/color/colors.dart';
import '../../utils/theme/utils.dart';
import '../../utils/widgets/feeds_gred_widger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _offerImage = [
    'assets/images/onboarding_image/onboard1.svg',
    'assets/images/onboarding_image/onboard2.svg',
    'assets/images/onboarding_image/onboard3.svg',
  ];
  final List<String> product = [
    // 'assets/images/tovary/man_clothes.jpg',
    // 'assets/images/onboarding_image/onboard1.svg',
  ];
  final List<String> latest = [
    // "assets/images/categories_image/clothescombo.png",
    // "assets/images/categories_image/clothescombo.png",
    // 'assets/images/onboarding_image/onboard1.svg',
  ];

  late TextEditingController _textEditingController;

  List<ProductsModel> productList = [];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).Screensize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Container(
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(),
                    fillColor: blueGrotto.withOpacity(0.16),
                    filled: true,
                    prefixIcon: Icon(
                      IconlyBroken.search,
                      color: blueGrotto,
                    ),
                    hintText: "Поиск",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: blueGrotto.withOpacity(0.7), width: 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(width: 2, color: blueGrotto)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: product.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        product[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 100,
              child: SizedBox(
                child: Center(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return SvgPicture.asset(
                        _offerImage[index],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: _offerImage.length,
                    autoplay: true,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        size: 7,
                        space: 5,
                        color: Colors.black12,
                        activeColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Последние товары",
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: Feeds(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Text("Просмотреть все"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: latest.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 110,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                latest[index],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<ProductsModel>>(
              future: APIHandler.getAllProducts(
                limit: '999',
              ),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Произошла ошибка${snapshot.error}"),
                  );
                } else if (snapshot.data == null) {
                  return const Center(
                    child: Text("Еще не добавлено ни одного продукта"),
                  );
                }
                return FeedsGridWidget(productsList: snapshot.data!);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
