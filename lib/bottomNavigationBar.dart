import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:appman_ecommerce/pages/cart.dart';
import 'package:appman_ecommerce/pages/favorite.dart';
import 'package:appman_ecommerce/pages/home.dart';
import 'package:appman_ecommerce/pages/settingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});
  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    Home(),
    CartScreen(),
    Favorite(),
    SettingsPage(),
  ];

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.favorite,
    Icons.account_circle_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 60,
        gapWidth: 10,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.white : Colors.white54;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                index == 0
                    ? "Home"
                    : index == 1
                        ? "Cart"
                        : index == 2
                            ? "Favorite"
                            : "Settings",
                maxLines: 1,
                style: TextStyle(color: color),
              ),
            ],
          );
        },
        backgroundColor: blackColor,
        activeIndex: _currentPageIndex,
        splashColor: customColor,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.end,
        onTap: (index) {
          setState(() => _currentPageIndex = index);
        },
      ),
    );
  }
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Account")),
    );
  }
}
