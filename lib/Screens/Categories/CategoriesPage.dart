import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Screens/Categories/HoodiePage/HoodieScreen.dart';
import 'package:hijabista/Screens/Categories/JacketPage/JacketScreen.dart';
import 'package:hijabista/Screens/Categories/SweatShirtPage/SweatShirtScreen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int current = 0;

  List<String> items = ["Hoodie", "Sweat Shirt", "Jacket"];
  List<IconData> icons = [Icons.home, Icons.explore, Icons.search];

  final List<Widget> screens = [
    HoodieScreen(),
    SweatShirtScreen(),
    JacketScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.only(left:20,right:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


 GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Add this to go back
                        },
                        child: CustomBackButtom(arrowColor: "black")
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(9),
              child: SizedBox(
                
                width: double.infinity,
                height: 46,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        margin: const EdgeInsets.all(5),
                        width: 105,
                        height: 18,
                        decoration: BoxDecoration(
                          color: current == index
                              ? AppColors.Peach
                              : Colors.white,
                          borderRadius: current == index
                              ? BorderRadius.circular(25)
                              : BorderRadius.circular(25),
                          border: current == index
                              ? Border.all(
                                  color: AppColors.Peach,
                                  width: 1.5,
                                )
                              : 
            Border.all(
                                  color: AppColors.Peach,
                                  width: 1.5,
                                ),
            
                              
                              
                              
                        ),
                        child: Center(
                          child: Text(
                            
                            items[index],
                            style: TextStyle(color: current == index
                              ? Colors.white
                              : AppColors.Peach,),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: items.length,
                controller: PageController(),
                onPageChanged: (index) {
                  setState(() {
                    current = index;
                  });
                },
                itemBuilder: (ctx, index) {
                  return screens[index];
                },
              ),
              
            ),

           
          ],
        ),
      ),
    );
  }
}
