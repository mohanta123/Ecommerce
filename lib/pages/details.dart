import 'package:flutter/material.dart';

import '../animation/bouncing_effects.dart';
import '../constants.dart';
import '../widgets/fonts.dart';
import 'orderPage.dart';

class DetailsPage extends StatefulWidget {
  final Map? data;
  final String? hero;
  const DetailsPage({super.key, required this.data, required this.hero});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int sizeSelected = 1;
  bool like = false;

  @override
  void initState() {
    if (widget.data!["isLiked"]) {
      like = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          elevation: 0,
          leading: Bouncing(
            onPress: () async {
              Navigator.pop(context, like);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
          ),
          title: Text(
            "ORDER DETAILS",
            style: TextFont.bold_TextStyle.copyWith(
              fontSize: 17,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    like = !like;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: like
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 22,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                          size: 22,
                        ),
                ),
              ),
            ),
          ],
          backgroundColor: defaultBackgroundColor,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: w,
            height: h,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: widget.hero!,
                    child: Container(
                      height: 350,
                      color: defaultBackgroundColor,
                      width: w,
                      child: InteractiveViewer(
                        child: Image.network(widget.data!["image"]),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.data!["stars"].toString(),
                          style: TextFont.bold_TextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(${widget.data!["reviews"].toString()} reviews)",
                          style: TextFont.normal_TextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${widget.data!["name"]}",
                                style: TextFont.bold_TextStyle.copyWith(
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "By -  ${widget.data!["store"]}",
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 24,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "DESCRIPTION :",
                          style: TextFont.bold_TextStyle.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${widget.data!["descripstion"]}",
                          style: TextFont.normal_TextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "SIZE :",
                          style: TextFont.bold_TextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ...List.generate(
                              widget.data!["size"].length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sizeSelected = index;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: sizeSelected == index
                                        ? customColor
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(14),
                                    ),
                                  ),
                                  child: Text(
                                    "${widget.data!["size"][index]}",
                                    style: TextFont.normal_TextStyle.copyWith(
                                      fontSize: 15,
                                      color: sizeSelected == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 120),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: w * 0.97,
            height: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.all(
                Radius.circular(36),
              ),
            ),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Price",
                          style: TextFont.bold_TextStyle
                              .copyWith(fontSize: 14, color: Colors.white54),
                        ),
                        Text(
                          "${widget.data!["price"].toString()} ₹",
                          style: TextFont.bold_TextStyle
                              .copyWith(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Bouncing(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: customColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                    child: Text(
                      "Order",
                      style: TextFont.normal_TextStyle.copyWith(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
