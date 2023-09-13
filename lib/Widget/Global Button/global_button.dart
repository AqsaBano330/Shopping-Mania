import 'package:flutter/material.dart';

class customGlobalButton extends StatelessWidget {
  const customGlobalButton({
    super.key,
    required this.buttonText,
  
    required this.width,
    required this.height,
    required this.fontSize,
    this.onPressed,
  });

  final buttonText;
  final void Function()? onPressed;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple, // Set the background color here
        shadowColor: Colors.red,
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // To make the row take minimum space
        children: [
          Text(buttonText, style: TextStyle(fontSize: fontSize)),
        ],
      ),
    );
  }
}
