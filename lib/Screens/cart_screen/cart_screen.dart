import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // List<Step> stepList() => [
  //       const Step(title: Text('Home'), content: Center(child: Text('Home'),)),
  //        const Step(title: Text('Cart'), content: Center(child: Text('Cart'),)),
  //         const Step(title: Text('Confirm'), content: Center(child: Text('Confirm'),))
  //  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: const Color(0xFF550080),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: const Text(
                        "Hi Aqsa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 10, left: 30),
                      child:
                          AddToCart(), // Make sure AddToCart is correctly implemented
                    ),
                  ],
                ),
              ],
            ),
          ),
          //      Stepper(
          //   steps: stepList(),
          // ),
          Expanded(
            child: CartItem.isEmpty
                ? Center(
                    child: Image.asset(
                    "assets/images/EmptyCart.png",
                    width: 200,
                    height: 200,
                  ))
                : ListView.builder(
                    itemCount: CartItem.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: Checkbox(
                          value: CartItem[index]["isChecked"],
                          onChanged: (bool? value) {
                            setState(() {
                              CartItem[index]["isChecked"] = value;
                            });
                          },
                        ),
                        title: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              child: Image.asset(
                                CartItem[index]["image"],
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 9.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(CartItem[index]["name"]),
                              ],
                            ),
                          ],
                        ),
                        trailing: Text(CartItem[index]["price"]),
                        onTap: () {
                          // Handle item tap here
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
