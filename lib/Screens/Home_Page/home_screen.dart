import 'package:flutter/material.dart';
import 'package:hijabista/Widget/Cards/cards.dart';
import 'package:hijabista/Screens/Home_Page/Home%20Bar/home_upper_bar.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map CurrentItems = {};
  List CartItems = [];

  List<String> BannerimageList = [
    'assets/images/offer card 1.jpg',
    'assets/images/offer card 2.jpg',
    'assets/images/offer card 3.jpg',
    'assets/images/offer card 2.jpg',
    'assets/images/offer card 3.jpg',
  ];

  List<String> imageList = [
    'assets/images/hijab_vector_1.jpg',
    'assets/images/hijab_vector_2.jpg',
    'assets/images/hijab_vector_1.jpg',
    'assets/images/hijab_vector_2.jpg',
    'assets/images/hijab_vector_1.jpg'
  ];

  List productName = ["Lemon", "Orange", "Tomato", "Apple", "Grapes"];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HomeUpperBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      // First PageView with CustomCard
                      SizedBox(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          itemCount: 5,
                          padEnds: false,
                          pageSnapping: true,
                          physics: const BouncingScrollPhysics(),
                          controller: PageController(
                            initialPage: 0,
                            viewportFraction: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            print(index % BannerimageList.length);
                            return Container(
                              margin: const EdgeInsets.only(top: 10, left: 8),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                BannerimageList[index % BannerimageList.length],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, top: 15, bottom: 0),
                        child: const Align(
                            alignment:
                                Alignment.centerLeft, // Align text to the left
                            child: CustomTextWidget(
                              yourtext: "Recommended",
                              fontweight: FontWeight.w400,
                              fontsize: 30,
                              fontColor: Color(0xff1E222B),
                            )),
                      ),

                      // Second PageView (You can customize it as needed)
                      SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          itemCount: imageList.length,
                          padEnds: false,
                          pageSnapping: false,
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          controller: PageController(
                            initialPage: 0,
                            viewportFraction: 0.4,
                          ),
                          itemBuilder: (context, index) {
                            return CustomCard(
                              index: index,
                              CurrentItems: CurrentItems,
                              CartItems: CartItems,
                              imageList: imageList,
                              alledgeinsets: 90,
                              circularRadius: 16,
                              imageHeight: 100,
                              imageWidth: 100,
                              ContainerHeight: 67,
                              ContainerWidth: 56,
                              margintop: 20,
                              marginbottom: 30,
                              marginleft: 10,
                              marginright: 10,
                              text1: productName[index],
                            );
                          },
                        ),
                      ),

                      // Third PageView (You can customize it as needed)
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          controller: PageController(
                            initialPage: 3,
                            viewportFraction: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            print(index % imageList.length);
                            return Container(
                              margin: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset(
                                imageList[index % imageList.length],
                                fit: BoxFit.cover,
                              ),
                            );
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
      ),
    );
  }
}
