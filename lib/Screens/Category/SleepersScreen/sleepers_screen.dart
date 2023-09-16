import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/categoryCard.dart';




List Sleepersimages = [
  "assets/images/sleeper1.PNG",
  "assets/images/sleeper2.jpg",
  "assets/images/sleeper3.jpg"
];
List SleepersNames = ["ColorPrint", "Western", "Desi"];

List SleepersType = ["Exported", "Exported", "Exported"];

List SleepersPrice = ["899", "566", "876"];

class SleepersScreen extends StatefulWidget {
  const SleepersScreen({super.key});

  @override
  State<SleepersScreen> createState() => _SleepersScreenState();
}

class _SleepersScreenState extends State<SleepersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:10, right:10, ),
      
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Sleepersimages.length,
        padEnds: false,
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.4,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            imageList: Sleepersimages,
            index: index,
            Categoryname: SleepersNames,
            Categorytype: SleepersType,
            price: SleepersPrice,
          );
        },
      ),
    );
  }
}
 