import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Home_Page/home_screen.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Widget/color/colors.dart';

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
      child: const Row(
        mainAxisSize: MainAxisSize.min, // To make the row take minimum space
        children: [
          Text("Get Started          ", style: TextStyle(fontSize: 20)),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
