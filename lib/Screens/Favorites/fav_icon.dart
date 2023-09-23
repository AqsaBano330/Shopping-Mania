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
          radius: 15,
          backgroundColor: Color.fromRGBO(0, 255, 255, 0.5),
        ),
        Positioned(
          child: IconButton(
            color: product[widget.index]["isFav"] == true
                ? Colors.red
                : Colors.black,
            onPressed: () {
              setState(() {
                
                product[widget.index]["isFav"] =
                    !product[widget.index]["isFav"];
                
                if (product[widget.index]["isFav"]) {
                  FavList.add(product[widget.index]);
                } else {
                  FavList.remove(product[widget.index]);
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

