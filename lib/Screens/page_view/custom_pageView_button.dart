import 'package:flutter/material.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class CustomPageViewButton extends StatelessWidget {
  const CustomPageViewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Peach,
        minimumSize: Size(270, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const  CurveBar()),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          CustomTextWidget(yourtext: "Get Started         ", fontweight: FontWeight.w600, fontsize: 20, fontColor: AppColors.White ),
          
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
