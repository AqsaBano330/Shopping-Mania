import 'package:flutter/material.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Widget/color/colors.dart';

class CustomGlobalButton extends StatefulWidget {
  const CustomGlobalButton(
      {super.key,
      required this.height,
      required this.width,
      required this.buttontext});

  final double height;
  final double width;
  final String buttontext;

  @override
  State<CustomGlobalButton> createState() => _CustomGlobalButtonState();
}

class _CustomGlobalButtonState extends State<CustomGlobalButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Peach,
        minimumSize: Size(widget.width, widget.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CurveBar()),
        );
      },
      child: Text(widget.buttontext, style: TextStyle(fontSize: 20)),
    );
  }
}
