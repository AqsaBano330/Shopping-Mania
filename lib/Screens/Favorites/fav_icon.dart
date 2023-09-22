import 'package:flutter/material.dart';
import 'package:hijabista/Lists/favoriteList.dart';
import 'package:hijabista/Lists/productList/productList.dart';


class FavIcon extends StatefulWidget {
  const FavIcon({super.key, required this.index});

  final int index;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      onPressed: () {
        setState(() {
          FavList.add(product[widget.index]);
        });

        setState(() {});
      },
      icon: Icon(Icons.favorite),
    ));
  }
}
