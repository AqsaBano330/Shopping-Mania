import 'package:flutter/material.dart';

class HoodiesScreen extends StatefulWidget {
  const HoodiesScreen({super.key});

  @override
  State<HoodiesScreen> createState() => _HoodiesScreenState();
}

class _HoodiesScreenState extends State<HoodiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Oh shiit"),
      ),
    );
  }
}