import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/KurtisScreen/kurtis_screen.dart';
import 'package:hijabista/Screens/Category/KurtisScreen/kurtistype.dart';

int index = 0;

class ColorprintKurtis extends StatefulWidget {
  const ColorprintKurtis({super.key});

  @override
  State<ColorprintKurtis> createState() => _ColorprintKurtisState();
}

class _ColorprintKurtisState extends State<ColorprintKurtis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:KurtisType(calledList: KurtiNames, index: index));
  }
}
