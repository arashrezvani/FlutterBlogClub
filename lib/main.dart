import 'package:blogclub/article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //تغییر رنگ نویگیشن گوشی و اپ بار خود گوشی
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static const defultFontFamily = 'Avenir';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            onSecondary: primaryTextColor,
            onSecondaryFixed: primaryColor,
            onError: Color(0xff7B8BB2),
            onBackground: primaryTextColor,
            background: primaryColor,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor,
              //elevation: 0, //shadowe شادوو رو صفر ميكنيم كه شادوو نداشته باشه
              titleSpacing: 32 //فاصله از كنارها
              ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
          textTheme: TextTheme(
            labelMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            labelSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            titleMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            displayMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontSize: 12),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 24,
                color: primaryTextColor,
                fontWeight: FontWeight.w700),
            headlineSmall: const TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            headlineLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            labelLarge: const TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Color(0xff7B8BB2),
            ),
          )),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      //   ],
      // ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };
  Future<bool> _onWillPop() async {
    // final NavigatorState currentSelectedTabNavigatorState =
    //     map[selectedScreenIndex]!.currentState!;
    // if (currentSelectedTabNavigatorState.canPop()) {
    //   currentSelectedTabNavigatorState.pop();
    //   return false;
    // }
    // else if(_history.isNotEmpty){
    //   setState(() {
    //     selectedScreenIndex=_history.last;
    //     _history.removeLast();
    //   });
    // }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //برای دکمه بازگشت از این پاپ اسکوپ استفاده میکنیم
      canPop: false,

      onPopInvokedWithResult: (didPop, result) {
        final NavigatorState currentSelectedTabNavigatorState =
            map[selectedScreenIndex]!.currentState!;
        if (currentSelectedTabNavigatorState.canPop()) {
          currentSelectedTabNavigatorState.pop();
        } else if (_history.isNotEmpty) {
          setState(() {
            selectedScreenIndex = _history.last;
            _history.removeLast();
          });
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  // HomeScreen(),
                  // ArticleScreen(),
                  // SearchScreen(),
                  // profileScreen(),
                  _navigator(_homeKey, homeIndex, const HomeScreen()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(
                      _searchKey,
                      searchIndex,
                      const SimpleScreen(
                        tabName: 'Search',
                      )),
                  _navigator(_menuKey, menuIndex, const profileScreen()),
                  // Navigator(
                  //     key: _articleKey,
                  //     onGenerateRoute: (settings) => MaterialPageRoute(
                  //         builder: (context) => Offstage(
                  //             offstage: selectedScreenIndex != articleIndex,
                  //             child: ArticleScreen()))),
                  // Navigator(
                  //     key: _searchKey,
                  //     onGenerateRoute: (settings) => MaterialPageRoute(
                  //         builder: (context) => Offstage(
                  //             offstage: selectedScreenIndex != searchIndex,
                  //             child: SimpleScreen()))),
                  // Navigator(
                  //     key: _menuKey,
                  //     onGenerateRoute: (settings) => MaterialPageRoute(
                  //         builder: (context) => Offstage(
                  //             offstage: selectedScreenIndex != menuIndex,
                  //             child: profileScreen()))),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    //برای اینکه حافظه زیاد مصرف نکنه این خط پایین رو بعد ریترن مینویسیم
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                      offstage: selectedScreenIndex !=
                          index, //براي كارايي و حافظه كمتر استفاده كردن
                      child: child,
                    )));
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key, required this.tabName, this.screenNumber = 1});
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Tab: $tabName, Screen #$screenNumber',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SimpleScreen(
                        tabName: tabName,
                        screenNumber: screenNumber + 1,
                      )));
            },
            child: Text('Click Me')),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff9B8487).withOpacity(0.3), //شادوی پشت منو
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'HomeActive.png',
                    title: 'Home',
                    isActive: selectedIndex == homeIndex,
                    onTap: () {
                      onTap(homeIndex);
                    },
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'ArticlesActive.png',
                    title: 'Article',
                    isActive: selectedIndex == articleIndex,
                    onTap: () {
                      onTap(articleIndex);
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'SearchActive.png',
                    title: 'Search',
                    isActive: selectedIndex == searchIndex,
                    onTap: () {
                      onTap(searchIndex);
                    },
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'MenuActive.png',
                    title: 'Menu',
                    isActive: selectedIndex == menuIndex,
                    onTap: () {
                      onTap(menuIndex);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0xff376AED),
                    border: Border.all(
                        color: Colors.white,
                        width: 4)), //یک حاشیه سفید دور دایره وسط منو
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/img/icons/${isActive ? activeIconFileName : iconFileName}'),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.labelLarge!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.onError),
            ),
          ],
        ),
      ),
    );
  }
}
