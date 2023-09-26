import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Screens/Address%20Screen/AddressScreen.dart';
import 'package:hijabista/Screens/ContinueShoppingScreen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

TextEditingController _CurrentAddress =
    TextEditingController(text: CurrentAddress);
TextEditingController FullName = TextEditingController();
TextEditingController City = TextEditingController();
TextEditingController ZipCode = TextEditingController();

bool light = true;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool isChecked = false;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Add this line
        body: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: [
              Container(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddressScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 40),
                      child: CustomBackButtom(arrowColor: 'black'),
                    ),
                  ),
                  Container(
                    child: CustomTextWidget(
                      yourtext: "Delivery Details",
                      fontweight: FontWeight.w700,
                      fontsize: 18,
                      fontColor: AppColors.Black,
                    ),
                  ),
                  Container(height: 40)
                ],
              ),
              Container(height: 40),
              TextField(
                controller: FullName,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.Peach), // Set the focused border color
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
              Container(
                height: 15,
              ),
              TextField(
                controller: City,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.Peach), // Set the focused border color
                  ),
                  border: OutlineInputBorder(),
                  labelText: "City",
                ),
              ),
              Container(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.datetime,
                controller: ZipCode,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.Peach), // Set the focused border color
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Zip Code",
                ),
              ),
              Container(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: TextField(
                  readOnly: true,
                  controller: _CurrentAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              AppColors.Peach), // Set the focused border color
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 230, top: 10),
                  child: Text(
                    "Edit Address",
                    style: TextStyle(color: AppColors.Peach),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: const Text("Notification:")),
                  Switch(
                    value: light,
                    activeColor: AppColors.Peach,
                    onChanged: (bool value) {
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                ],
              ),
              Container(height: 190),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.Peach,
                  minimumSize: Size(230, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          height: 600,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomTextWidget(
                                    yourtext: "Card Details",
                                    fontweight: FontWeight.w700,
                                    fontsize: 18,
                                    fontColor: AppColors.Black,
                                  ),
                                ),
                                Container(height: 40),
                                TextField(
                                  keyboardType: TextInputType.datetime,
                                  controller: FullName,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .Peach), // Set the focused border color
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: 'Card Number',
                                  ),
                                ),
                                Container(
                                  height: 15,
                                ),
                                TextField(
                                  controller: City,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .Peach), // Set the focused border color
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: "Expiry Date",
                                  ),
                                ),
                                Container(
                                  height: 15,
                                ),
                                TextField(
                                  keyboardType: TextInputType.datetime,
                                  controller: ZipCode,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .Peach), // Set the focused border color
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: "CVV",
                                  ),
                                ),
                                Container(height: 20),
                                Container(
                                  child: Row(children: [
                                    Text("Make it Default:"),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                      child: Container(
                                        width: 40, // Adjust the size as needed
                                        height: 40, // Adjust the size as needed
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black, // Border color
                                            width: 2, // Border width
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              8), // Adjust the borderRadius to make it square
                                          color: isChecked
                                              ? Colors.blue
                                              : Colors
                                                  .transparent, // Checked and unchecked color
                                        ),
                                        child: isChecked
                                            ? Icon(
                                                Icons.check,
                                                color: Colors
                                                    .white, // Checkmark color
                                              )
                                            : null,
                                      ),
                                    )
                                  ]),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.Peach,
                                    minimumSize: Size(200, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ContinueShopping()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text("Add Card"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
