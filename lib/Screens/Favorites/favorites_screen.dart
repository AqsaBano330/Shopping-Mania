import 'package:flutter/material.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}); // Fixed the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: const Color(0xFF550080),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: const Text(
                        "Hi Aqsa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10, left: 30),
                      child: AddToCart(),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}