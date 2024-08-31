import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/fonts.dart';

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
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            height: deviceHeight * 0.16,
            width: deviceWidth,
            child: Stack(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    SizedBox(width: deviceWidth*0.05 ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextFont.bold_TextStyle.copyWith(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: deviceHeight*0.01, ),
                              Row(
                                children: [
                                  Text(
                                    "₹${item.price}",
                                    style: TextFont.normal_TextStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: deviceWidth*0.02),
                                  Text(
                                    "${item.quantity}",
                                    style: TextFont.normal_TextStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(width: deviceWidth*0.02),
                                  Text(
                                    "${item.discount}% off",
                                    style: TextFont.normal_TextStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: deviceHeight*0.01, ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item.increaseQuantity();
                                      });
                                    },
                                    child: Container(
                                      height: deviceHeight*0.035,
                                      width: deviceWidth*0.08,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  SizedBox(width: deviceWidth*0.03),
                                  Text("${item.quantity}"),
                                  SizedBox(width: deviceWidth*0.03),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item.decreaseQuantity();
                                      });
                                    },
                                    child: Container(
                                      height: deviceHeight*0.035,
                                      width: deviceWidth*0.08,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.remove),
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
    );
  }
}
