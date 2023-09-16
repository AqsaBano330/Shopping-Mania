import 'package:flutter/material.dart';

class CurrentKurti extends StatefulWidget {
  const CurrentKurti({super.key});

  @override
  State<CurrentKurti> createState() => _CurrentKurtiState();
}

class _CurrentKurtiState extends State<CurrentKurti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current"),
      ),
    );
  }
}