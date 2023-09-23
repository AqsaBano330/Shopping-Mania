import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Favorites/fav_icon.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class CustomCard extends StatefulWidget {
  final int index;

  CustomCard({
    Key? key,
    required this.index,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 100,
        padding: EdgeInsets.only(top: 10),
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
                    image: AssetImage(product[widget.index]["image"]),
                    fit: BoxFit.cover,
                  ))),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              product[widget.index]["name"],
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
                yourtext: product[widget.index]["price"].toString(),
                fontweight: FontWeight.w700,
                fontsize: 14,
                fontColor: Colors.black,
              ),
              FavIcon(
                index: widget.index,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item Added to Cart'),
                        action: SnackBarAction(
                          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                          disabledBackgroundColor: Color.fromRGBO(0, 0, 0, 0),
                          textColor: AppColors.Peach,
                          label: 'View Cart',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()),
                            );
                          },
                        ),
                      ),
                    );
setState(() {

  CartItem.add(product[widget.index]);
                    AddToCart(CartItem:CartItem, cartColor: "white",);
  
});
                    

                    // setState(() {});
                  });
                },
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
