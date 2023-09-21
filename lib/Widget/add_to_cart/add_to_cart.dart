import 'package:flutter/material.dart';
import 'package:hijabista/Lists/favoriteList.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("assets/images/bag.png"),
          ),
          Positioned(
            right: 2,
            top: 2,
            child: Builder(
              builder: (context) {
                return CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.black,
                  child: Text(
                    FavList.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
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
