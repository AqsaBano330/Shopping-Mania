import 'package:flutter/material.dart';


class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int cart_value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            child: Image.asset("assets/images/bag.png"),
            height: 30,
            width: 30,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //                 (AddItemtoCart(CurrentItems: {"a": "a"}))),
          //       );
          //     },
          //     child: Text("cart")),
          // Container(
          //   color: Colors.yellow,
          //   height: 200,
          //   width: 200,
          // ),
          Positioned(
            right: 2,
            top: 2,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: Colors.black,
              child: Text(
                cart_value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
