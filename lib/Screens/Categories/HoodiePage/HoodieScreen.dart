import 'package:flutter/material.dart';
import 'package:hijabista/Lists/Category%20List/Categorlist.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class HoodieScreen extends StatefulWidget {
  const HoodieScreen({Key? key});

  @override
  State<HoodieScreen> createState() => _HoodieScreenState();
}

class _HoodieScreenState extends State<HoodieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 130,
            child: Image.asset("assets/images/50offbanner.PNG"),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Hoodie.length,
              padEnds: false,
              //pageSnapping: false,
              // physics: const BouncingScrollPhysics(),
              reverse: true,
              controller: PageController(
                viewportFraction: 0.32,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 15,
                    left: 15,
                    right: 15,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: CustomTextWidget(
                            yourtext: Hoodie[index]["name"],
                            fontweight: FontWeight.w600,
                            fontsize: 13,
                            fontColor: AppColors.Black),
                      ),
                      Spacer(),
                      Container(
                          height: 150,
                          child: Image.asset(Hoodie[index]["image"])),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
