import 'package:flutter/material.dart';
import 'package:hijabista/Widget/Search%20Bar/search_bar.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class HomeUpperBar extends StatefulWidget {
  const HomeUpperBar({Key? key});

  @override
  State<HomeUpperBar> createState() => _HomeUpperBarState();
}

class _HomeUpperBarState extends State<HomeUpperBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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


              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 30),
                  child: const AddToCart()),
            ],
          ),
          const SizedBox(height: 16.0),
          const  Center(child: CustomSearchBar()),
        ],
      ),
    );
  }
}
