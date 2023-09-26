import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Address%20Screen/AddressScreen.dart';
import 'package:hijabista/Screens/DetailsScreen/DetailsScreen.dart';

import 'package:hijabista/Screens/splashScreen/splash_screen.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';




// main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Include the bottom bar here
    );
  }
}
