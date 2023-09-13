import 'package:flutter/material.dart';

class CustomPageViewButton extends StatelessWidget {
  const CustomPageViewButton({
    Key? key,
    required this.buttonText,
    required this.navigatedClassName,
    required this.width,
    required this.height,
    required this.fontSize,
  }) : super(key: key);

  final String buttonText;
  final Widget navigatedClassName;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffCB4E47), // Set the background color here
        shadowColor: Color.fromARGB(242, 140, 40, 0),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(29.0), // Adjust the radius as needed
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigatedClassName),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // To make the row take minimum space
        children: [
          Text(buttonText, style: TextStyle(fontSize: fontSize)),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
