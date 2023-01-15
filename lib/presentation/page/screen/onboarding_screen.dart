import 'package:flutter/material.dart';
import 'package:shopping_centre/presentation/model/onboard.dart';
import 'package:shopping_centre/utils/app_constants/color/colors.dart';
import '../../../utils/app_constants/widgets/dotindicator.dart';
import '../../../utils/app_constants/widgets/onboarding_content.dart';
import '../registration/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: demoData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardingContent(
                      image: demoData[index].image,
                      title: demoData[index].title,
                      description: demoData[index].description),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController
                            .nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease)
                            .then((value) => LogIn());
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), backgroundColor: blueg),
                      child: Icon(Icons.arrow_forward_ios, color: white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
