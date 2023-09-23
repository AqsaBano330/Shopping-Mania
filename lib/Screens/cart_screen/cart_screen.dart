import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hijabista/Widget/color/colors.dart';

num TotalPrice = 0;
num DeliveryCharges = 120;

num CountTotalAmount(num TotalPrice, num DeliveryCharges) {
  num discount;
  num ShoppingAmount = TotalPrice;

  return (discount = (TotalPrice / 100) * 20);
}



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
                        contentPadding: EdgeInsets.only(left: 20.0, right: 4),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (CartItem[index]["isChecked"] == false) {
                                  CartItem[index]["isChecked"] = true;
                                  TotalPrice = TotalPrice +
                                      CartItem[index]["uniqueitemprice"];
                                } else if (CartItem[index]["isChecked"] ==
                                    true) {
                                  CartItem[index]["isChecked"] = false;
                                  TotalPrice = TotalPrice -
                                      CartItem[index]["uniqueitemprice"];
                                }
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CartItem[index]["isChecked"]
                                    ? AppColors.Peach
                                    : Colors.transparent,
                                border: Border.all(
                                  color: AppColors
                                      .Peach, // Change border color to orange
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: CartItem[index]["isChecked"]
                                    ? const Icon(
                                        Icons.check,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        title: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 0),
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
                                Text(CartItem[index]["price"].toString())
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
                                      showCustomToast("Out of Stock",
                                          Colors.black.withOpacity(0.7));
                                    } else {
                                      CartItem[index]["itemamount"]++;
                                      int uniqueitemprice = CartItem[index]
                                              ["itemamount"] *
                                          CartItem[index]["price"];
                                      CartItem[index]["uniqueitemprice"] =
                                          uniqueitemprice;
                                      if (CartItem[index]["isChecked"] ==
                                          true) {
                                        TotalPrice = TotalPrice +
                                            CartItem[index]["price"];
                                      }

                                      print(CartItem[index]["uniqueitemprice"]);
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
                                    if (CartItem[index]["isChecked"] == true) {
                                      TotalPrice =
                                          TotalPrice - CartItem[index]["price"];
                                    }
                                    if (CartItem[index]["itemamount"] == 0) {
                                      CartItem.removeAt(index);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Visibility(
            visible: !CartItem.isEmpty,
            child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Shopping Amount:  ${TotalPrice} "),
                    Text(
                        "Discount: -${CountTotalAmount(TotalPrice, DeliveryCharges)}"),
                    Text(TotalPrice == 0
                        ? "Delivery Charges: 0"
                        : "Delivery Charges: $DeliveryCharges"),
                    Text(TotalPrice == 0
                        ? "Total Price: 0":

                        "Total Price:  ${TotalPrice - CountTotalAmount(TotalPrice, DeliveryCharges) + DeliveryCharges}")
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void showCustomToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
