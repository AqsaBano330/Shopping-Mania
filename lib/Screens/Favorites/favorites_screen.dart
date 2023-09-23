import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/favoriteList.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart'; // Make sure to import AddToCart

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
                      child: AddToCart(CartItem: CartItem, cartColor: "black",), // Make sure AddToCart is correctly implemented
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: FavList.length,
              itemBuilder: (context, index) {
                final productItem = FavList[index];
                return ListTile(
                  tileColor: Colors.grey,
                  leading: Image.asset(productItem["image"]),
                  title: Text(productItem["name"]),
                  subtitle: Text(productItem["price"]),
                  trailing: IconButton(
                    color: productItem["isFav"] == true
                        ? Colors.red
                        : Colors.black,
                    onPressed: () {
                      setState(() {
                        productItem["isFav"] = !productItem["isFav"];
                        if (productItem["isFav"]) {
                          FavList.add(productItem);
                        } else {
                          FavList.remove(productItem);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
