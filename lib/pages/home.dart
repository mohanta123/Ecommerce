import 'dart:async';
import 'package:appman_ecommerce/pages/subcategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../animation/bouncing_effects.dart';
import '../constants.dart';
import '../data/data.dart';
import '../widgets/drawer.dart';
import '../widgets/fonts.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  final int _bannerCount = 3;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  @override
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Color(0xff212121),
      systemNavigationBarColor: Color(0xff212121),
      statusBarColor: defaultBackgroundColor,
    ));
    super.initState();
    _startAutoScroll();
  }

  void dispose() {
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < _bannerCount - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  int currentIndexBottomBar = 0;
  int currentIndexSwiperHome = 0;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.person_outline,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          elevation: 0,
          title: Text(
            "Ecommerce",
            style: TextFont.bold_TextStyle.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      drawer: CustomDrawer(),
      body: SizedBox(
        width: w,
        height: h,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              sendBar(w),
              const SizedBox(height: 20),
              marks(w),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 130,
                    width: 350,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: _bannerCount,
                      itemBuilder: (context, index) {
                        return Container(
                          width: w * 0.95,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                right: -30,
                                child: Image.asset(
                                  "images/products/product0.png",
                                  height: 120,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(1),
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.5),
                                      Colors.black.withOpacity(0.0),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TODAY ONLY",
                                      style: TextFont.bold_TextStyle.copyWith(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "80% OFF\nWITH CODE:",
                                      style: TextFont.bold_TextStyle.copyWith(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 120,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: customColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(36),
                                      ),
                                    ),
                                    child: Text(
                                      "ECOMMERCE",
                                      textAlign: TextAlign.center,
                                      style: TextFont.bold_TextStyle.copyWith(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        _bannerCount,
                        (index) => GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            width: 30,
                            height: 5,
                            color: _currentIndex != index
                                ? Colors.white54
                                : customColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: w * 0.95,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: TextFont.bold_TextStyle.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "View More",
                        style: TextFont.normal_TextStyle.copyWith(
                          fontSize: 13,
                          color: customColor,
                        ),
                      ),
                    ]),
              ),
           SizedBox(height: 20),
              SizedBox(
                width: w * 0.95,
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    ...List.generate(
                      products.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => DetailsPage(
                                data: products[index],
                                hero: "${products[index]["name"]}-$index",
                              ),
                            ),
                          ).then((value) {
                            if (value) {
                              products[index]["isLiked"] = true;
                              setState(() {});
                            } else if (!value) {
                              products[index]["isLiked"] = false;
                              setState(() {});
                            }
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 6,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            height: 280,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: defaultBackgroundColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Hero(
                                        tag:
                                            "${products[index]["name"]}-$index",
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          child: SizedBox(
                                            height: 180,
                                            width: double.infinity,
                                            child: Image.network(
                                              products[index]["image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              products[index]["isLiked"] =
                                                  !products[index]["isLiked"];
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 20,
                                            child: Icon(
                                              Icons.favorite,
                                              color: products[index]["isLiked"]
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(products[index]["stars"]
                                                .toString()),
                                            const SizedBox(width: 5),
                                            Text(
                                              "(${products[index]["reviews"].toString()} reviews)",
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            products[index]["name"],
                                            style: TextFont.bold_TextStyle
                                                .copyWith(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            "${products[index]["price"].toString()} ₹",
                                            style: TextFont.bold_TextStyle
                                                .copyWith(
                                              fontSize: 15,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget marks(double w) {
    return Container(
      width: w,
      margin: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...List.generate(
            brandes.length,
            (index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Search",
                        style: TextFont.bold_TextStyle.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(brandes[index]["image"]),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Subcategory(brandes[index]["lable"])));
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        brandes[index]["lable"],
                        style: TextFont.bold_TextStyle.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          )
        ]),
      ),
    );
  }

  Container sendBar(double w) {
    return Container(
      width: w * 0.95,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(36),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: customColor,
              borderRadius: BorderRadius.all(
                Radius.circular(36),
              ),
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              height: double.infinity,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Send to:",
                    style: TextFont.normal_TextStyle.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Bekashi, Algeria",
                    style: TextFont.normal_TextStyle.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Bouncing(
            onPress: () {},
            child: Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: customColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(36),
                ),
              ),
              child: Text(
                "Change",
                style: TextFont.normal_TextStyle.copyWith(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
