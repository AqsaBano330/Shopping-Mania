import 'package:flutter/material.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/color/colors.dart';

class KurtisType extends StatelessWidget {
  const KurtisType({super.key, required this.calledList, required this.index});

  final List calledList;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

  //       iconTheme: IconThemeData(
  //   color: Colors.black, //change your color here
  // ),
        title: Text(calledList[index],style: TextStyle(color:Colors.white),),
        backgroundColor: AppColors.Peach,
        actions: [Container(
          margin: EdgeInsets.all(20),
          child: AddToCart(CartItem: CartItem, cartColor: "white",))],
      ),
    );
  }
}
