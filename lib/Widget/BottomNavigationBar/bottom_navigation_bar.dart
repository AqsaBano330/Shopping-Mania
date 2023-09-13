import 'package:flutter/material.dart';
import 'package:hijabista/Screens/Category/category_page.dart';
import 'package:hijabista/Screens/Favorites/favorites_screen.dart';
import 'package:hijabista/Screens/Home_Page/home_screen.dart';
import 'package:hijabista/Screens/More/more_page.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  const BottomNavigationBarDemo({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CategoryPage(),
    const FavoritesPage(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple[200],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          // Perform navigation based on the selected item
          // if (index == 0) {
          //   // Navigate to the Home page
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //   );
          // } else if (index == 2) {
          //   // Navigate to the Favorites page
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => FavoritesPage()),
          //   );
          // }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFF550080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
            backgroundColor: Color(0xFF550080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
            backgroundColor: Color(0xFF550080),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: "More",
            backgroundColor: Color(0xFF550080),
          ),
        ],
      ),
    );
  }
}
