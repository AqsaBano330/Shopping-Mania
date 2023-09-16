import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/categoryCard.dart';

List Hoodieimages = [
  "assets/images/hoodie1.jpg",
  "assets/images/hoodie3.jpg",
  "assets/images/hoodie3.PNG"
];
List HoodieNames = ["ColorPrint", "Western", "Desi"];

List HoodieType = ["Exported", "Exported", "Exported"];

List HoodiePrice = ["899", "566", "876"];


class HoodiesScreen extends StatefulWidget {
  const HoodiesScreen({super.key});

  @override
  State<HoodiesScreen> createState() => _HoodiesScreenState();
}

class _HoodiesScreenState extends State<HoodiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:10, right:10, ),
      
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Hoodieimages.length,
        padEnds: false,
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.4,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            imageList: Hoodieimages,
            index: index,
            Categoryname: HoodieNames,
            Categorytype: HoodieType,
            price: HoodiePrice,
          );
        },
      ),
    );
  }
}