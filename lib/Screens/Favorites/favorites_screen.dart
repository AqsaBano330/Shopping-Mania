import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/favoriteList.dart';

import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart'; // Make sure to import AddToCart

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
            height: 110,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CurveBar(),
                          ),
                        );
                      },
                      child: Container(
                        child: CustomBackButtom(arrowColor: 'black'),
                      ),
                    ),
                    Container(
                      child: CustomTextWidget(
                        yourtext: "Favorites",
                        fontweight: FontWeight.w700,
                        fontsize: 18,
                        fontColor: AppColors.Black,
                      ),
                    ),
                    Container(
                      child: AddToCart(
                        CartItem: CartItem,
                        cartColor: "black",
                      ),
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
                return Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      
                      bottom: BorderSide(
                        color: Colors.orange, // Orange color for the bottom line
                        width: 1.0, // Adjust the thickness as needed
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners for the image
                      child: Image.asset(productItem["image"]),
                    ),
                    title: Text(productItem["name"]),
                    subtitle: Text(productItem["price"].toString()),
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
