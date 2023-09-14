import 'package:flutter/material.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Screens/page_view/custom_pageView_button.dart';
import 'package:hijabista/Widget/text/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({Key? key}) : super(key: key);

  final controller = PageController();

  final List<String> mainHeading = [
    "Your Holiday shopping",
    "At Your Doorstep",
    "Seamless Checkout Experience"
  ];
  final List<String> subHeading = [
    "Jet-set your way to vacation bliss with our Tour Holiday Shopping – where every click takes you a step closer to your dream getaway",
    "Travel the world from your doorstep with our Tour Holiday Shopping – bringing the globe's finest to your doorstep.",
    "Effortless Checkout: Shop with ease, as our streamlined checkout process ensures a quick and stress-free shopping experience, right from your screen to your doorstep."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [
            //       Colors.black,
            //       Colors.transparent,
            //     ],
            //   )
            // ),
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/online_shopping_1.jpg",
              fit: BoxFit.fill, 
            )),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black,
                Colors.black87,
                Colors.black26,
                Colors.black26,
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          top: 350.0, bottom: 0.0, right: 30, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:30),
                            child: CustomTextWidget(
                                yourtext: mainHeading[index],
                                fontweight: FontWeight.w700,
                                fontsize: 29,
                                fontColor: Colors.white,),
                          ),
                          const SizedBox(height: 16.0),
                          CustomTextWidget(
                              yourtext: subHeading[index],
                              fontweight: FontWeight.w400,
                              fontsize: 14,
                              
                              fontColor:  Colors.grey)
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top:0, bottom:40),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 2,
                    dotWidth: 8.0,
                    dotHeight: 6.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.white,
                    activeDotColor: Color(0xffCB4E47),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: CustomPageViewButton(),
              ),
              const SizedBox(height: 20), 
            ],
          ),
        ),
      ]),
    );
  }
}
