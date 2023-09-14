import 'package:flutter/material.dart';
import 'package:hijabista/Widget/color/colors.dart';

class customGlobalButton extends StatelessWidget {
  const customGlobalButton({
    super.key,
    required this.buttonText,
    required this.width,
    required this.height,
    required this.fontSize,
    this.onPressed, });

  final String buttonText;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double fontSize;
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Peach,
        shadowColor: Colors.black,
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(buttonText, style: TextStyle(fontSize: fontSize)),
        ],
      ),
    );
  }
}
