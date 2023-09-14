import 'package:flutter/material.dart';

class CustomTextWidget extends StatefulWidget {

 final String yourtext;
 
  const CustomTextWidget({super.key, required this.yourtext});



  @override
  State<CustomTextWidget> createState() => _CustomTextWidgetState();
}


class _CustomTextWidgetState extends State<CustomTextWidget> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.yourtext, style: TextStyle(),),
    );
  }
}
