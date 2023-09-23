import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/category_page.dart';
import 'package:hijabista/Screens/Favorites/favorites_screen.dart';

import 'package:hijabista/Screens/Home_Page/home_screen.dart';
import 'package:hijabista/Screens/More/more_page.dart';

import 'package:hijabista/Widget/color/colors.dart';


class CurveBar extends StatefulWidget {
  const CurveBar({super.key});

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int index = 0;
  final screen = const [
    HomePage(),
    CategoryPage(),
    FavoritesPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 25),
      const Icon(Icons.category, size: 25),
      const Icon(Icons.favorite, size: 25),
      const Icon(Icons.more, size: 25),
      
    ];
    return Scaffold(
     
      extendBody: false,
      body: screen[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(
          color: Colors.white,
        )),
        child: CurvedNavigationBar(
          color: AppColors.Black,
          buttonBackgroundColor: AppColors.Peach,
          backgroundColor: Colors.transparent,
          items: items,
          height: 50,
          index: index,
          onTap: (index) => setState(
            () => this.index = index,
          ),
        ),
      ),
    );
  }
}






