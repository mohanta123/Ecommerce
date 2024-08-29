import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../animation/bouncing_effects.dart';
import '../constants.dart';
import '../data/data.dart';
import '../widgets/drawer.dart';
import 'cart.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Color(0xff212121),
      systemNavigationBarColor: Color(0xff212121),
      statusBarColor: defaultBackgroundColor,
    ));
    super.initState();
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
          title: const Text(
            "Ecommerce",
            style: TextStyle(
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
              Container(
                width: w * 0.95,
                height: 130,
                decoration: const BoxDecoration(
                  color: blackColor,
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff212121).withOpacity(1),
                            const Color(0xff212121).withOpacity(0.8),
                            const Color(0xff212121).withOpacity(0.7),
                            const Color(0xff212121).withOpacity(0.5),
                            const Color(0xff212121).withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "TODAY ONLY",
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.3,
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            "80% OFF\nWITH CODE:",
                            style: TextStyle(
                              fontSize: 22,
                              height: 1.3,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Bouncing(
                        onPress: () {},
                        child: Container(
                          width: 120,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: customColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(36),
                            ),
                          ),
                          child: const Text(
                            "GCOMMERC",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                        (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.5),
                        width: 30,
                        height: 5,
                        color: currentIndexSwiperHome != index
                            ? Colors.white54
                            : const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: w * 0.95,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Most Popular",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "View More",
                        style: TextStyle(
                          fontSize: 18,
                          color: customColor,
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
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
                                          child: Text(products[index]["name"]),
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 4),
                                          child: Text(
                                            "${products[index]["price"].toString()} £",
                                            style: const TextStyle(
                                              fontSize: 19,
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
                    children: const [
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
                        style: TextStyle(fontSize: 16),
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
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(brandes[index]["image"]),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        brandes[index]["lable"],
                        style: const TextStyle(fontSize: 16),
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
                children: const [
                  Text(
                    "Send to:",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    "Bekashi, Algeria",
                    style: TextStyle(
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
              width: 90,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: customColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(36),
                ),
              ),
              child: const Text(
                "Change",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
