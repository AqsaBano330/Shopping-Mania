import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/KurtisScreen/ColorprintKurti.dart';
import 'package:hijabista/Screens/Category/SleepersScreen/sleepers_screen.dart';
import 'package:hijabista/Widget/text/text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.imageList,
    required this.index,
    required this.Categoryname,
    required this.Categorytype,
    required this.price,
  });

  final List imageList;
  final int index;
  final List Categoryname;
  final List Categorytype;
  final List price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ColorprintKurtis()),
  );},
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 10, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Border radius for the image
              child: Image.asset(
                imageList[index],
                height: 167,
                width: 137, // Adjust the width of the image as needed
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 16), 
            
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child:
            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(yourtext: Categoryname[index], fontweight: FontWeight.w700, fontsize: 18, fontColor: Color(0xff1E222B)),
                CustomTextWidget(yourtext: Categorytype[index], fontweight: FontWeight.w400, fontsize: 16, fontColor: Color(0xff616A7D)),
                Spacer(),
                Text("Starting From", style: TextStyle(color: Color(0xff8891A5)),),
                CustomTextWidget(yourtext: price[index], fontweight: FontWeight.w400, fontsize: 16, fontColor: Color(0xff2A4BA0)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
