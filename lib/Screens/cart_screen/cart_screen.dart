import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                      child: AddToCart(
                        CartItem: CartItem,
                        cartColor: "white",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: CartItem.isEmpty
                ? Center(
                    child: Image.asset(
                      "assets/images/EmptyCart.png",
                      width: 150,
                      height: 150,
                    ),
                  )
                : ListView.builder(
                    itemCount: CartItem.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        enabled: true,
                        contentPadding: EdgeInsets.all(5.0),
                        leading: Checkbox(
                          value: CartItem[index]["isChecked"] ??
                              false, // Set to false if it's null
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
                            SizedBox(width: 3.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(CartItem[index]["name"]),
                                Text(CartItem[index]["price"])
                              ],
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          height: 30,
                          child: Wrap(
                            spacing: 1.0, // Horizontal spacing between items
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    if (CartItem[index]["itemamount"] ==
                                        product[index]["Stock"]) {
                                      Fluttertoast.showToast(
                                        msg: "This is Center Short Toast",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    } else {
                                      CartItem[index]["itemamount"]++;
                                    }
                                  });
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  CartItem[index]["itemamount"].toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    CartItem[index]["itemamount"]--;
                                    if (CartItem[index]["itemamount"] == 0) {
                                      CartItem.removeAt(index);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
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
