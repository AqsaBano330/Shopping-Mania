import 'package:flutter/material.dart';
import 'package:hijabista/Lists/favoriteList.dart';
import 'package:hijabista/Lists/productList/productList.dart';


class FavIcon extends StatefulWidget {
  const FavIcon({Key? key, required this.index});

  final int index;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center alignment
      children: [
        CircleAvatar(
          radius: 1,
          backgroundColor:  Colors.transparent,
        ),
        Positioned(
          child: IconButton(
            color: homeproducts[widget.index]["isFav"] == true
                ? Colors.red 
                : Colors.grey,
            onPressed: () {
              setState(() {
                
                homeproducts[widget.index]["isFav"] =
                    homeproducts[widget.index]["isFav"];
                
                if (homeproducts[widget.index]["isFav"]) {
                  FavList.add(homeproducts[widget.index]);
                } else {
                  FavList.remove(homeproducts[widget.index]);
                }
              });
            },
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ),
      ],
    );
  }
}

