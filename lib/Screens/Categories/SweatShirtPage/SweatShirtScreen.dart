import 'package:flutter/material.dart';
import 'package:hijabista/Lists/Category%20List/Categorlist.dart';

class SweatShirtScreen extends StatefulWidget {
  const SweatShirtScreen({super.key});

  @override
  State<SweatShirtScreen> createState() => _SweatShirtScreenState();
}

class _SweatShirtScreenState extends State<SweatShirtScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [
                      
                      Text(Hoodie[index]["name"]),
                      Spacer(),
                      Container(
                        height:150,
                        child: Image.asset(Hoodie[index]["image"])),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),);
  }
}