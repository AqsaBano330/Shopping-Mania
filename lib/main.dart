import 'package:flutter/material.dart';
import 'package:hijabista/Screens/page_view/page_view.dart';
import 'package:hijabista/Widget/Category%20tab%20bar/cateogory_tabbar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
List tabbarList = ["hi", "bye", "shye"]; 
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Example(
        ));
  }
}
