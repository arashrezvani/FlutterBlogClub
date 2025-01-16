import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
          debugPrint('Onboarding: Selected page -> $page');
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color background = Color(0xffFBFCFF);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Container(
              height: 260,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  //Expanded براي اينكه بقيه فضاي باقيمانده را استفاده كنيم يا پر كنيم
                  Expanded(
                      child: PageView.builder(
                          itemCount: items.length,
                          controller:
                              _pageController, //اين باعث ميشه با اون نقطه زيري كه جابجا ميكنيم باهم مرتبط باشند
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].title,
                                    style: themeData.textTheme.headlineSmall,
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    items[index].description,
                                    style: themeData.textTheme.labelMedium!
                                        .apply(fontSizeFactor: 0.7),
                                  )
                                ],
                              ),
                            );
                          })),
                  Container(
                    height: 60,
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              activeDotColor: themeData.colorScheme.primary,
                              dotColor: themeData.colorScheme.primary
                                  .withOpacity(.1)),
                        ),
                        ElevatedButton(
                            //onPressed رفتار كليك كردن روي دكمه
                            onPressed: () {
                              if (page == items.length - 1) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              } else {
                                _pageController.animateToPage(page + 1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    themeData.colorScheme.primary),
                                iconColor:
                                    const WidgetStatePropertyAll(Colors.white),
                                minimumSize:
                                    const WidgetStatePropertyAll(Size(84, 60)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            child: Icon(page == items.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
