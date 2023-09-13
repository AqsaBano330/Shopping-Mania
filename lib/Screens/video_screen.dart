import 'package:flutter/material.dart';

class IntroVideo extends StatefulWidget {
  const IntroVideo({super.key});

  @override
  State<IntroVideo> createState() => _IntroVideoState();
}

class _IntroVideoState extends State<IntroVideo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
       Container(
          height:double.infinity,
          width:double.infinity,
          child: Image.asset("assets/images/online_shopping_1.jpg",fit: BoxFit.fill,color:Color.fromRGBO(255, 255, 255, 0.5),colorBlendMode: BlendMode.modulate)),
          
      
    );
  }
}