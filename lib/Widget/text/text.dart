import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.yourtext,
      required this.fontweight,
      required this.fontsize,
      required this.toppadding,
      required this.bottompadding,
      required this.leftpadding,
      required this.rightpadding,
      required this.margintop,
      required this.marginbottom,
      required this.marginleft,
      required this.marginright});

  final String yourtext;
  final FontWeight fontweight;
  final double fontsize;
  final double toppadding;
  final double bottompadding;
  final double leftpadding;
  final double rightpadding;
  final double margintop;
  final double marginbottom;
  final double marginleft;
  final double marginright;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: toppadding,
          bottom: bottompadding,
          left: leftpadding,
          right: rightpadding),
      margin: EdgeInsets.only(
        top: margintop,
        bottom: marginbottom,
        left: marginleft,
        right: marginright,
      ),
      child: Text(yourtext,
          style: TextStyle(
            fontFamily: "Manrope",
            fontWeight: fontweight,
            fontSize: fontsize,
            color: Colors.white,
          )),
    );
    ;
  }
}
