import 'package:flutter/material.dart';
import 'package:hijabista/Screens/cart_screen/add_item_to_cart.dart';

class CustomCard extends StatefulWidget {
  final List<String> imageList = [
    "assets/images/hijab_vector_1.jpg",
    "assets/images/hijab_vector_1.jpg",
    "assets/images/hijab_vector_1.jpg",
    "assets/images/hijab_vector_1.jpg",
    "assets/images/hijab_vector_1.jpg"
  ];
  final int index;
  final double alledgeinsets;
  final double circularRadius;
  final double imageHeight;
  final double imageWidth;
  final String text1;

  final double ContainerHeight;
  final double ContainerWidth;
  final double margintop;
  final double marginbottom;
  final double marginleft;
  final double marginright;

  CustomCard({
    Key? key,
    required this.index,
    required this.alledgeinsets,
    required this.circularRadius,
    required this.imageHeight,
    required this.imageWidth,
    required List<String> imageList,
    CurrentItems,
    CartItems,
    required this.ContainerHeight,
    required this.ContainerWidth,
    required this.margintop,
    required this.marginbottom,
    required this.marginleft,
    required this.marginright,
    required this.text1,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Map CurrentItems = {};
  List CartItems = [];

  void addItem() {
    setState(() {
      CurrentItems['text1'] = widget.text1;
      CurrentItems['text2'] = 'Organic';
      CurrentItems["image"] = widget.imageList[widget.index];

      // Print the CurrentItems map
      print(CurrentItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.ContainerHeight,
      width: widget.ContainerWidth,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
          top: widget.margintop,
          bottom: widget.marginbottom,
          left: widget.marginleft,
          right: widget.marginright),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFFd3d3d3),
        borderRadius: BorderRadius.circular(widget.circularRadius),
      ),
      child: Column(
        children: [
          Container(
              height: widget.imageHeight,
              width: widget.imageWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.imageList[widget.index]),
                    fit: BoxFit.cover,
                  ))),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              widget.text1,
              style: const TextStyle(
                fontFamily: "Manrope",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Text("Oraganic"),
          Row(
            children: [
              Text("phoo"),
              ElevatedButton(
                onPressed: addItem,
                child: Text("+"),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
