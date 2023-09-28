import 'package:flutter/material.dart';
import 'package:hijabista/Screens/splashScreen/splash_screen.dart';
import 'package:hijabista/Widget/Search%20Bar/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
