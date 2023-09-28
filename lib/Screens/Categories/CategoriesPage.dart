import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

List<String> items = [
  "Home",
  "Explore",
  "Search",
  "Feed",
  "Post",
  "Activity",
  "Setting",
  "Profile",
];

int current = 0;

List<IconData> icons = [
  Icons.home,
  Icons.explore,
  Icons.search,
  Icons.feed,
  Icons.post_add,
  Icons.local_activity,
  Icons.settings,
  Icons.person
];

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CurveBar(),
                            ),
                          );
                        },
                        child: Container(
                          child: CustomBackButtom(arrowColor: 'black'),
                        ),
                      ),
                      Container(
                        child: CustomTextWidget(
                          yourtext: "Categories",
                          fontweight: FontWeight.w700,
                          fontsize: 18,
                          fontColor: AppColors.Black,
                        ),
                      ),
                      Container(
                        child: AddToCart(
                          CartItem: CartItem,
                          cartColor: "black",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      /// CUSTOM TABBAR
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 80,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: current == index
                                            ? Colors.white70
                                            : Colors.white54,
                                        borderRadius: current == index
                                            ? BorderRadius.circular(15)
                                            : BorderRadius.circular(10),
                                        border: current == index
                                            ? Border.all(
                                                color: Colors.deepPurpleAccent,
                                                width: 2)
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          items[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: current == index,
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            shape: BoxShape.circle),
                                      ))
                                ],
                              );
                            }),
                      ),

                      /// MAIN BODY
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: double.infinity,
                        height: 550,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icons[current],
                              size: 200,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              items[current],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
