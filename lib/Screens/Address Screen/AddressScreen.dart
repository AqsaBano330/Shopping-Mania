import 'package:flutter/material.dart';
import 'package:hijabista/Lists/Address/Address.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({Key? key});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                const CustomBackButtom(
                  arrowColor: 'black',
                ),
                Text("Delivery Address"),
                AddToCart(CartItem: CartItem, cartColor: "black"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: AddressList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AddressList[index]["isborder"] == true
                            ? AppColors.Peach:
                             Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Address ${index + 1}", // You can replace this with your actual content
                        style: TextStyle(fontSize: 16),
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
