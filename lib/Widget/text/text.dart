import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.yourtext,
      required this.fontweight,
      required this.fontsize,
      required this.fontColor});

  final String yourtext;
  final FontWeight fontweight;
  final double fontsize;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return Text(yourtext,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Manrope",
          fontWeight: fontweight,
          fontSize: fontsize,
          color: fontColor,
        ));
  }
}
