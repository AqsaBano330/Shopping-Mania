import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Address%20Screen/AddressScreen.dart';
import 'package:hijabista/Screens/Home_Page/home_screen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

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
            height: 110,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        child: const CustomBackButtom(arrowColor: 'black'),
                      ),
                    ),
                    Container(
                      child: CustomTextWidget(
                        yourtext: "Cart",
                        fontweight: FontWeight.w700,
                        fontsize: 18,
                        fontColor: AppColors.Black,
                      ),
                    ),
                    Container(
                      child: AddToCart(
                        CartItem: CartItem,
                        cartColor: "black",
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
                      final Item = CartItem[index];
                      String deletedItem=CartItem[index]["name"];
                      return Dismissible(
                        key: Key(Item["name"].toString()),
                        background: Container(
                            child: Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Icon(Icons.delete)),
                            color: Colors.red),
                        onDismissed: (direction) {
                          
                          setState(() {
                            CartItem.removeAt(index);
                          });

                        
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '$deletedItem is deleted')));
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors
                                    .Peach, 
                                width: 1.0, 
                              ),
                            ),
                          ),
                          child: ListTile(
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                              left: 20.0,
                              right: 4,
                            ),
                            leading: Container(
                              margin: const EdgeInsets.only(right: 0),
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 10, left: 2),
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
                                      color: AppColors.Peach,
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
                                  padding: const EdgeInsets.only(left: 0),
                                  margin: const EdgeInsets.only(left: 0),
                                  child: Image.asset(
                                    CartItem[index]["image"],
                                    width: 45.0,
                                    height: 45.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 3.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        CartItem[index]["name"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          CartItem[index]["price"].toString(),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const Text("\$",
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              height: 30,
                              child: Wrap(
                                spacing: 1.0,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
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
                                          print(CartItem[index]
                                              ["uniqueitemprice"]);
                                        }
                                      });
                                    },
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      CartItem[index]["itemamount"].toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        CartItem[index]["itemamount"]--;
                                        if (CartItem[index]["isChecked"] ==
                                            true) {
                                          TotalPrice = TotalPrice -
                                              CartItem[index]["price"];
                                        }
                                        if (CartItem[index]["itemamount"] ==
                                            0) {
                                          CartItem.removeAt(index);
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 20, bottom: 10),
                    child: Text(
                      "Shopping Amount: ${TotalPrice} ",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
                    child: Text(
                      "Discount: -${CountTotalAmount(TotalPrice, DeliveryCharges)}",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
                    child: Text(
                      TotalPrice == 0
                          ? "Delivery Charges: 0"
                          : "Delivery Charges: $DeliveryCharges",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 10, bottom: 30),
                    child: Text(
                      TotalPrice == 0
                          ? "Total Price: 0"
                          : "Total Price:  ${TotalPrice - CountTotalAmount(TotalPrice, DeliveryCharges) + DeliveryCharges}",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.Peach,
                        minimumSize: const Size(230, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressScreen()),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                              yourtext: "Check Out",
                              fontweight: FontWeight.w500,
                              fontsize: 15,
                              fontColor: AppColors.White),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
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
