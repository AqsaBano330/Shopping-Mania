import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';



class AddToCart extends StatefulWidget {
  const AddToCart({Key? key, required this.CartItem, required this.cartColor});

  final List CartItem;
  final String cartColor;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: widget.cartColor == "black"
                  ? Image.asset("assets/images/blackbag.png")
                  : Image.asset("assets/images/whitebag.png"),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Builder(
                builder: (context) {
                  return CircleAvatar(
                    radius: 8,
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
      );
    
  }
}
