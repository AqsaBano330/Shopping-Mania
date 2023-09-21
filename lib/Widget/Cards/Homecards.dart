import 'package:flutter/material.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Favorites/fav_icon.dart';
import 'package:hijabista/Widget/text/text.dart';

class CustomCard extends StatelessWidget {
  final int index;

  CustomCard({
    Key? key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 100,
        padding: EdgeInsets.only(top:10),
        margin: EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
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
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(product[index]["image"]),
                    fit: BoxFit.cover,
                  ))),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              product[index]["name"],
              style: const TextStyle(
                fontFamily: "Manrope",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff1E222B),
              ),
            ),
          ),
          const Text(
            "Organic",
            style: TextStyle(
              fontFamily: "Manrope",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xff616A7D),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                yourtext: product[index]["price"].toString(),
                fontweight: FontWeight.w700,
                fontsize: 14,
                fontColor: Colors.black,
              ),

              FavIcon(index: index,),
          
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text("+"),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            ],
          )
        ]));
  }
}
