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
      ColorFiltered(
        colorFilter: index == 0
            ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : ColorFilter.mode(Colors.black, BlendMode.srcIn),
        child: const Icon(Icons.home, size: 26),
      ),
      ColorFiltered(
        colorFilter: index == 1
            ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : ColorFilter.mode(Colors.black, BlendMode.srcIn),
        child: const Icon(Icons.category, size: 26),
      ),
      ColorFiltered(
        colorFilter: index == 2
            ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : ColorFilter.mode(Colors.black, BlendMode.srcIn),
        child: const Icon(Icons.favorite, size: 26),
      ),
      ColorFiltered(
        colorFilter: index == 3
            ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : ColorFilter.mode(Colors.black, BlendMode.srcIn),
        child: const Icon(Icons.more, size: 26),
      ),
    ];

    return Scaffold(
      extendBody: false,
      body: screen[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: AppColors.Peach,
        backgroundColor: Colors.white,
        items: items,
        height: 50,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
