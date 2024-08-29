import 'package:flutter/material.dart';

import '../constants.dart';

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
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            height: h * 0.14,
            width: w,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "₹${item.price}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${item.quantity}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${item.discount}% off",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.increaseQuantity();
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text("${item.quantity}"),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.decreaseQuantity();
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
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
