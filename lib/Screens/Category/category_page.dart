import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:hijabista/Widget/color/colors.dart';

List<String> tabbarList = ["Kurtis", "Sleepers","Hoodies", "Shoes"];

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: DefaultTabController(
          length: tabbarList.length,
          child: Column(
            children: [
              Container(
                color: AppColors.Peach,
                height: 200,
              ),
              Container(
                padding: const EdgeInsets.only(left:5,
                  top: 10,
                ),
                child: ButtonsTabBar(
                  height: 50,
                  radius: 25,
                  decoration:  BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.Peach,
                  ),
                  
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(color:Colors.black),
                  labelSpacing: 2,
                  labelStyle: const TextStyle(
                    letterSpacing: 2,
                    wordSpacing: 9,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: tabbarList.map((tab) {
                    return Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0), // Adjust padding here
                        child: Text(
                          tab,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
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
