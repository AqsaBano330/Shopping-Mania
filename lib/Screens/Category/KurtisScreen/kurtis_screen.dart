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

class KurtisScreen extends StatefulWidget {
  const KurtisScreen({super.key});

  @override
  State<KurtisScreen> createState() => _KurtisScreenState();
}

class _KurtisScreenState extends State<KurtisScreen> {
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
