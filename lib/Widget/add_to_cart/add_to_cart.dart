import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/favoriteList.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CartScreen()),
    );
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/images/bag.png"),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Builder(
                builder: (context) {
                  return CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.black,
                    child: Text(
                      CartItem.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
