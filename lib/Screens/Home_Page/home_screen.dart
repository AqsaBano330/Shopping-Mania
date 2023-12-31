import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Favorites/fav_icon.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';
import 'package:hijabista/Widget/CarousalSlider/Carousal_slider.dart';
import 'package:hijabista/Widget/Search%20Bar/search_bar.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/productDetail/productDetail.dart';
import 'package:hijabista/Widget/text/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 160,
              color: AppColors.Peach,
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: const CustomTextWidget(
                            yourtext: 'Hi Aqsa,',
                            fontweight: FontWeight.w400,
                            fontsize: 18.0,
                            fontColor: Color(0xffF8F9FB)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()),
                          );
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 30),
                            child: AddToCart(
                              cartColor: "white",
                              CartItem: CartItem,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  Center(child: 
                  
                  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 248, 224, 211),
        minimumSize: Size(15,45 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SearchBarScreen()),
        );
      },
                  
                  
                  
                  
                   child:  Row(children: [
                    Icon(Icons.search, color: Colors.grey[600],),
                    Container(padding: EdgeInsets.only(left: 10),
                      child: Text( "Search Anything",style:TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15,color: Colors.grey[600],
                      )  ),
                    )
                  ],))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: CarousalSlider()),
                    const SizedBox(height: 2),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 0, bottom: 0),
                      child: const Align(
                          alignment:
                              Alignment.centerLeft, // Align text to the left
                          child: CustomTextWidget(
                            yourtext: "Recommended",
                            fontweight: FontWeight.w500,
                            fontsize: 23,
                            fontColor: Color(0xff1E222B),
                          )),
                    ),
                    SizedBox(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: allproducts.length,
                        padEnds: false,
                        //pageSnapping: false,
                        // physics: const BouncingScrollPhysics(),
                        reverse: true,
                        controller: PageController(
                          viewportFraction: 0.5,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                      imagePath: allproducts[index]["image"],
                                      title: allproducts[index]["name"],
                                      price: allproducts[index]["price"]
                                          .toString(),
                                      details: allproducts[index]["details"],
                                      reviews: allproducts[index]["reviews"],
                                      ratings: allproducts[index]["ratings"],
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 300,
                                width: 150,
                                padding: const EdgeInsets.only(top: 4),
                                margin: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 0,
                                  left: 10,
                                  right: 10,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 170,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              allproducts[index]["image"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                        allproducts[index]["name"],
                                        style: const TextStyle(
                                          fontFamily: "Manrope",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E222B),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 60),
                                          child: CustomTextWidget(
                                            yourtext: allproducts[index]
                                                    ["price"]
                                                .toString(),
                                            fontweight: FontWeight.w700,
                                            fontsize: 14,
                                            fontColor: Colors.black,
                                          ),
                                        ),
                                        const CustomTextWidget(
                                          yourtext: "\$",
                                          fontweight: FontWeight.w700,
                                          fontsize: 14,
                                          fontColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              child: FavIcon(
                                index: index,
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 0, bottom: 0),
                      child: const Align(
                          alignment:
                              Alignment.centerLeft, // Align text to the left
                          child: CustomTextWidget(
                            yourtext: "Hot in the Town",
                            fontweight: FontWeight.w500,
                            fontsize: 23,
                            fontColor: Color(0xff1E222B),
                          )),
                    ),
                    SizedBox(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: allproducts.length,
                        padEnds: false,
                        //pageSnapping: false,
                        // physics: const BouncingScrollPhysics(),
                        reverse: true,
                        controller: PageController(
                          viewportFraction: 0.5,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                            imagePath: allproducts[index]
                                                ["image"],
                                            title: allproducts[index]["name"],
                                            price: allproducts[index]["price"]
                                                .toString(),
                                            details: allproducts[index]
                                                ["details"],
                                            reviews: allproducts[index]
                                                ["reviews"],
                                            ratings: allproducts[index]
                                                ["ratings"],
                                            index: index,
                                          )),
                                );
                              },
                              child: Container(
                                  height: 300,
                                  width: 150,
                                  padding: const EdgeInsets.only(top: 4),
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 0, left: 10, right: 10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(children: [
                                    Container(
                                        height: 170,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  allproducts[index]["image"]),
                                              fit: BoxFit.cover,
                                            ))),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                        allproducts[index]["name"],
                                        style: const TextStyle(
                                          fontFamily: "Manrope",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xff1E222B),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 60),
                                          child: CustomTextWidget(
                                            yourtext:allproducts[index]
                                                    ["price"]
                                                .toString(),
                                            fontweight: FontWeight.w700,
                                            fontsize: 14,
                                            fontColor: Colors.black,
                                          ),
                                        ),
                                        const CustomTextWidget(
                                            yourtext: "\$",
                                            fontweight: FontWeight.w700,
                                            fontsize: 14,
                                            fontColor: Colors.black),
                                      ],
                                    )
                                  ])),
                            ),
                            Positioned(
                              child: FavIcon(
                                index: index,
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}