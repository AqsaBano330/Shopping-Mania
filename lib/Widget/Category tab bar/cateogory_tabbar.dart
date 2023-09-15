

import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

List tabbarList = ["Fish", "Yogurt", "Chilli"];


class Example extends StatelessWidget {


  const Example({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              ButtonsTabBar(
                backgroundColor: Colors.red,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: tabbarList.map((tab) {
                  return Tab(
                    text: tab,
                  );
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: tabbarList.map((tab) {
                    return Center(
                      child: Text(tab), // Replace with your content
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
