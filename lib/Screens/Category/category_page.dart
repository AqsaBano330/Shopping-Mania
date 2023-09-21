// import 'package:flutter/material.dart';
// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:hijabista/Screens/Category/HoodiesScreen/hoodies_screen.dart';
// import 'package:hijabista/Screens/Category/KurtisScreen/kurtis_screen.dart';
// import 'package:hijabista/Screens/Category/ShoesScreen/shoes_screen.dart';
// import 'package:hijabista/Screens/Category/SleepersScreen/sleepers_screen.dart';
// import 'package:hijabista/Screens/Category/WatchScreen/watch_screen.dart';
// import 'package:hijabista/Widget/Search%20Bar/search_bar.dart';
// import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';

// import 'package:hijabista/Widget/color/colors.dart';
// import 'package:hijabista/Widget/text/text.dart';

// List<String> CategorytabbarList = ["Kurtis", "Sleepers", "Hoodies", "Shoes", "Watch"];
// List<Widget> navigatedList = [
//   KurtisScreen(),
//   SleepersScreen(),
//   HoodiesScreen(),
//   ShoesScreen(),
//   WatchScreen(),
// ];

// class CategoryPage extends StatelessWidget {
//   const CategoryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: CategorytabbarList.length,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//              Container(
//       height: 250,
//       color: AppColors.Peach,
//       padding: EdgeInsets.all(18.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(top: 20, bottom: 10),
//                 child: const CustomTextWidget(
//                 yourtext: 'Hi Aqsa,', 
//                 fontweight: FontWeight.w400, 
//                 fontsize: 18.0, 
//                 fontColor: Color(0xffF8F9FB)),
//               ),


//               Container(
//                   padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30),
//                   child: const AddToCart()),
//             ],
//           ),
//           CustomTextWidget(yourtext: "Shop", fontweight: FontWeight.w300, fontsize: 50, fontColor: Color(0xffFAFBFD)),
//           Container(
//             margin: EdgeInsets.only(bottom: 6),
//             child: CustomTextWidget(yourtext: "By Category", fontweight: FontWeight.w800, fontsize: 50, fontColor: Color(0xffFAFBFD)))
          
//         ],
//       ),
//     ),
//               Container(
//                 padding: const EdgeInsets.only(
//                   left: 5,
//                   top: 10,
//                 ),
//                 child: ButtonsTabBar(
//                   height: 50,
//                   radius: 25,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     color: AppColors.Peach,
//                   ),
//                   unselectedBackgroundColor: Colors.white,
//                   unselectedLabelStyle: const TextStyle(color: Colors.black),
//                   labelSpacing: 2,
//                   labelStyle: const TextStyle(
//                     letterSpacing: 2,
//                     wordSpacing: 9,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   tabs: CategorytabbarList.map((tab) {
//                     return Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           tab,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: navigatedList,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
