import 'package:flutter/material.dart';
import 'package:hijabista/Widget/Search%20Bar/search_bar.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';

class HomeUpperBar extends StatelessWidget {
  const HomeUpperBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xFF550080),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
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
                  child: AddToCart()),
            ],
          ),
          SizedBox(height: 16.0),
          Center(child: CustomSearchBar()),
        ],
      ),
    );
  }
}
