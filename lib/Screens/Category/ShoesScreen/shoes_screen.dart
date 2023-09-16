import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/categoryCard.dart';

List Kurtiimages = [
  "assets/images/Kurti1.jpeg",
  "assets/images/Kurti2.jpeg",
  "assets/images/kurti3.jpg"
];
List KurtiNames = ["ColorPrint", "Western", "Desi"];

List KurtiType = ["Exported", "Exported", "Exported"];

List KurtiPrice = ["899", "566", "876"];


class ShoesScreen extends StatefulWidget {
  const ShoesScreen({super.key});

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  Widget build(BuildContext context) {
   return Container(
      padding: EdgeInsets.only(left:10, right:10, ),
      
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Kurtiimages.length,
        padEnds: false,
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.4,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            imageList: Kurtiimages,
            index: index,
            Categoryname: KurtiNames,
            Categorytype: KurtiType,
            price: KurtiPrice,
          );
        },
      ),
    );
  }
}
