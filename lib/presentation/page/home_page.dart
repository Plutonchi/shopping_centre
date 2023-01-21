import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:shopping_centre/utils/app_constants/theme/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _offerImage = [
    'assets/images/categories_image/beautifuly.png',
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).Screensize;
    return Scaffold(
      body: SizedBox(
        height: size.height * 0.33,
        child: Center(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                _offerImage[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: _offerImage.length,
            autoplay: true,
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor: Colors.red,
                )),
          ),
        ),
      ),
    );
  }
}
