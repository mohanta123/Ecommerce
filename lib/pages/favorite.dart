import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/fonts.dart';
import 'details.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => DetailsPage(
                      data: product,
                      hero: "${product["name"]}-$index",
                    ),
                  ),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      product["isLiked"] = value;
                    });
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defaultBackgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Hero(
                              tag: "${product["name"]}-$index",
                              child: ClipRRect(
                                borderRadius:  const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Image.network(
                                  product["image"],
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product["isLiked"] = !product["isLiked"];
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 20,
                                  child: Icon(
                                    Icons.favorite,
                                    color: product["isLiked"]
                                        ? Colors.red
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  SizedBox(height: 8),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4),
                        child: Text(product["name"], style: TextFont.bold_TextStyle.copyWith(
                          fontSize: 13,
                          color: Colors.black,
                        ),),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "${product["price"]} ₹",
                          style: TextFont.bold_TextStyle.copyWith(
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                      ),
                   SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                          Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          SizedBox(width: 4),
                            Text(product["stars"].toString(),style: TextFont.bold_TextStyle.copyWith(
                              fontSize: 13,
                              color: Colors.black,
                            ),),
                    SizedBox(width: 4),
                            Text(
                              "(${product["reviews"]} reviews)",
                              style: TextFont.normal_TextStyle.copyWith(
                                fontSize: 10,
                                color: Colors.black54,
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
          },
        ),
      ),
    );
  }
}
