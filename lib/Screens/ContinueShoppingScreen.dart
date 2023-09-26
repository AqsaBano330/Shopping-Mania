import 'package:flutter/material.dart';

class ContinueShopping extends StatelessWidget {
  const ContinueShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/success.png",
              height: double.infinity,
              width: double.infinity,
            )));
  }
}
