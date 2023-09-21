
import 'package:flutter/material.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Home_Page/Home%20Upper%20Bar/home_upper_bar.dart';
import 'package:hijabista/Widget/Cards/Homecards.dart';
import 'package:hijabista/Widget/CarousalSlider/Carousal_slider.dart';

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

  // List product = [
  //   {"image": "assets/images/hijab_vector_1.jpg", "title": "Lemon"},
  //   {"image": "assets/images/hijab_vector_2.jpg", "title": "Orange"},
  //   {"image": "assets/images/hijab_vector_1.jpg", "title": "Tomato"},
  //   {"image": "assets/images/hijab_vector_2.jpg", "title": "Apple"},
  //   {"image": "assets/images/hijab_vector_1.jpg", "title": "Grapes"}
  // ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const HomeUpperBar(),
               
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                margin: EdgeInsets.only(top: 10),
                child: CarousalSlider()),
                      const SizedBox(height: 10),

              //First PageView with CustomCard
              // SizedBox(
              //   height: 140,
              //   width: MediaQuery.of(context).size.width,
              //   child: PageView.builder(
              //     itemCount: 5,
              //     padEnds: false,
              //     pageSnapping: true,
              //     physics: const BouncingScrollPhysics(),
              //     controller: PageController(
              //       initialPage: 0,
              //       viewportFraction: 0.7,
              //     ),
              //     itemBuilder: (context, index) {
              //       print(index % BannerimageList.length);
              //       return Container(
              //         margin: const EdgeInsets.only(top: 10, left: 8),
              //         clipBehavior: Clip.antiAlias,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         child: Image.asset(
              //           BannerimageList[index % BannerimageList.length],
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     },
              //   ),
              // ),

              Container(
                margin:
                    const EdgeInsets.only(left: 10, top: 0, bottom: 0),
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
                height: 320,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: product.length,
                  padEnds: false,
                  pageSnapping: false,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(index: index,
                     
                         
                      
                    );
                  },
                ),
              ),

              // Third PageView (You can customize it as needed)
              SizedBox(
                height: 257,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: product.length,
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
