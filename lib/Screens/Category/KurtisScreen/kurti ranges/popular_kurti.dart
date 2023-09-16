import 'package:flutter/material.dart';

class PopularKurti extends StatefulWidget {
  const PopularKurti({super.key});

  @override
  State<PopularKurti> createState() => _PopularKurtiState();
}

class _PopularKurtiState extends State<PopularKurti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("popular kurti"),),
    );
  }
}