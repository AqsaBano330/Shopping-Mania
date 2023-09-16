import 'package:flutter/material.dart';

class TrendyKurti extends StatefulWidget {
  const TrendyKurti({super.key});

  @override
  State<TrendyKurti> createState() => _TrendyKurtiState();
}

class _TrendyKurtiState extends State<TrendyKurti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trendy Kurti"),
      ),
    );
  }
}