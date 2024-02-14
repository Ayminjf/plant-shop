import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/screens/cart_screen.dart';
import 'package:plant_shop/screens/favorite_screen.dart';
import 'package:plant_shop/screens/home_screen.dart';
import 'package:plant_shop/screens/profile_screen.dart';
import 'package:plant_shop/screens/scan_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int bottomIndex = 0;
  List<Plant> favorites = [];
  List<Plant> mycart = [];

  List<Widget> screens() {
    return [
      const HomeScreen(),
      FavoriteScreen(
        favoritedPlants: favorites,
      ),
      CartScreen(addedToCartPlants: mycart),
      const ProfileScreen(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> appBarTitle = [
    "خانه",
    "علاقه‌‌مندی‌ها",
    "سبد‌خرید",
    "پروفایل",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constants.greyColor,
                size: 30,
              ),
              Text(
                appBarTitle[bottomIndex],
                style: TextStyle(
                  fontFamily: "lalezar",
                  color: Constants.greyColor,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(index: bottomIndex, children: screens()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              Navigator.push(
                context,
                PageTransition(
                  child: const ScanScreen(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset("assets/images/code-scan-two.png", height: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: bottomIndex,
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Constants.greyColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
            List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            List<Plant> addToCartPlants = Plant.addedToCartPlants();

            favorites = favoritedPlants.toSet().toList();
            mycart = addToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
