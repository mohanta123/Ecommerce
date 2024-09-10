import 'package:flutter/material.dart';

import '../animation/bouncing_effects.dart';
import '../constants.dart';
import '../widgets/fonts.dart';
import 'orderPage.dart';

// Define a model class for the item
class CartItem {
  final String imageUrl;
  final String name;
  final int price;
  int quantity; // Changed from final to allow updates
  final int discount;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1, // Default quantity to 1
    required this.discount,
  });

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) { // Ensure quantity doesn't go below 1
      quantity--;
    }
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample data
  final List<CartItem> items = [
    CartItem(
      imageUrl: "images/profile.jpg",
      name: "Kalbavi splits keshew",
      price: 9,
      quantity: 1, // Default quantity to 1
      discount: 5,
    ),
    CartItem(
      imageUrl: "images/profile.jpg",
      name: "Kalbavi splits keshew",
      price: 9,
      quantity: 1, // Default quantity to 1
      discount: 5,
    ),
    CartItem(
      imageUrl: "images/profile.jpg",
      name: "Kalbavi splits keshew",
      price: 9,
      quantity: 1, // Default quantity to 1
      discount: 5,
    ),
    CartItem(
      imageUrl: "images/profile.jpg",
      name: "Kalbavi splits keshew",
      price: 9,
      quantity: 1, // Default quantity to 1
      discount: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return SizedBox(
                  height: h * 0.16,
                  width: w,
                  child: Stack(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: w * 0.2,

                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: h * 0.14,
                                  ),
                                ),
                              ),
                              SizedBox(width: w * 0.05),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextFont.bold_TextStyle.copyWith(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Row(
                                      children: [
                                        Text(
                                          "₹${item.price}",
                                          style: TextFont.normal_TextStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: w * 0.02),
                                        Text(
                                          "${item.quantity}",
                                          style: TextFont.normal_TextStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: w* 0.02),
                                        Text(
                                          "${item.discount}% off",
                                          style: TextFont.normal_TextStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item.increaseQuantity();
                                            });
                                          },
                                          child: Container(
                                            height:h * 0.035,
                                            width: w * 0.08,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Icon(Icons.add, size: 16),
                                          ),
                                        ),
                                        SizedBox(width:w * 0.03),
                                        Text("${item.quantity}"),
                                        SizedBox(width: w* 0.03),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item.decreaseQuantity();
                                            });
                                          },
                                          child: Container(
                                            height: h * 0.035,
                                            width: w* 0.08,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Icon(Icons.remove, size: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
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
