import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarousalSlider extends StatefulWidget {
  @override
  State<CarousalSlider> createState() => _CarousalSliderState();
}

class _CarousalSliderState extends State<CarousalSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> carouselImageList = [
    "assets/images/winter sale/winter_sale2.PNG",
    "assets/images/winter sale/winter_sale4.jpg",
    "assets/images/winter sale/winter_sale6.jpg",
    "assets/images/winter sale/winter_sale1.jpg",
    "assets/images/winter sale/winter_sale2.jfif",
    "assets/images/winter sale/winter_sale5.jpg",
    "assets/images/winter sale/winter_sale3.PNG",
    "assets/images/winter sale/winter_sale7.jfif",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: carouselImageList.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            height: 150,
            autoPlayInterval: Duration(seconds: 2),
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselImageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
