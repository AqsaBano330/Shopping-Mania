import 'package:flutter/material.dart';
import 'package:hijabista/Widget/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:hijabista/Screens/page_view/custom_pageView_button.dart';
import 'package:hijabista/Screens/page_view/page_view_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({Key? key}) : super(key: key);

  final controller = PageController();

  final List<String> mainHeading = [
    "Your Holiday shopping Delivered to Screen one",
    "Your Holiday shopping Delivered to Screen two"
  ];
  final List<String> subHeading = [
    "There's something for everyone to enjoy with sweet shop Favorite Screen 1",
    "There's something for everyone to enjoy with sweet shop Favorite Screen 1"
  ];

  @override
  Widget build(BuildContext context) {
    final precacheImages = [
      pageViewImages().pageViewImageList[0],
      pageViewImages().pageViewImageList[1],
    ];

    precacheImages.forEach((image) {
      precacheImage(AssetImage(image), context);
    });

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
            child: Image.asset("assets/images/online_shopping_1.jpg",
                fit: BoxFit.fill, colorBlendMode: BlendMode.modulate)),
        Container(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.repeated,
                begin: Alignment.bottomCenter, // Start at the top center
                end: Alignment.topCenter, // End at the bottom center
                colors: [
                  Colors.black,
                  Colors.black87,
                  Colors.black26
                  , // Start with black at the top

                  Colors.transparent,
                  // End with transparent at the bottom
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 350.0, bottom: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              mainHeading[index],
                              style: const TextStyle(
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              subHeading[index],
                              style: const TextStyle(
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(height: 16.0),
                            // Image.asset(pageViewImages().pageViewImageList[index],
                            //     height: 250),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 2,
                    dotWidth: 25.0,
                    dotHeight: 6.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.white,
                    activeDotColor: Color(0xffCB4E47),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: CustomPageViewButton(
                    buttonText: "Get Started",
                    navigatedClassName: BottomNavigationBarDemo(),
                    width: 270,
                    height: 60,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20), // Add some space above the indicator
                
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
