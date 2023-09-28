import 'package:flutter/material.dart';
import 'package:hijabista/Lists/favoriteList.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hijabista/Widget/color/colors.dart';

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
          radius: 0,
          backgroundColor: Colors.transparent,
        ),
        Positioned(
          child: IconButton(
            
            
            onPressed: () {
              setState(() {
                // homeproducts[widget.index]["isFav"] =
                //     homeproducts[widget.index]["isFav"];

                if (homeproducts[widget.index]["isFav"] == true) {
                  FavList.remove(homeproducts[widget.index]);
                  homeproducts[widget.index]["isFav"] = false;


                } else {
                  FavList.add(homeproducts[widget.index]);
                  homeproducts[widget.index]["isFav"] = true;
                  
                }
              });
            },
            icon: FaIcon(FontAwesomeIcons.solidHeart,
            size: 20,
            color: homeproducts[widget.index]["isFav"] == true
                ? AppColors.Peach
                : Colors.grey,)
          ),
        ),
      ],
    );
  }
}
