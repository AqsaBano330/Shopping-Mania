import 'package:flutter/material.dart';
import 'package:hijabista/Lists/Address/Address.dart';
import 'package:hijabista/Screens/DetailsScreen/DetailsScreen.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

Map AddMap = {};

String CurrentAddress = "";



class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController ChangeAddress = TextEditingController();
  TextEditingController AddAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
          body: Column(
        children: [
          Container(height: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
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
                  yourtext: "Delivery Address",
                  fontweight: FontWeight.w700,
                  fontsize: 18,
                  fontColor: AppColors.Black,
                ),
              ),
              Container(height: 50)
            ],
          ),
          Expanded(
            child: Stack(children: [
              ListView.builder(
                  itemCount: AddressList.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              AddressList[index]["isborder"] = true;

                              for (int i = 0; i < AddressList.length; i++) {
                                if (i != index) {
                                  AddressList[i]["isborder"] = false;
                                }
                              }

                              CurrentAddress = AddressList[index]["Address"];
                              print(CurrentAddress);
                            },
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AddressList[index]["isborder"] == true
                                      ? AppColors.Peach
                                      : Colors.grey,
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 20, left:20 ),
                                  child: Center(
                                      child:
                                          Text(AddressList[index]["Address"])),
                                ),
                                IconButton(
                                    onPressed: () {
                                      ChangeAddress.text =
                                          AddressList[index]["Address"];
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    "Update Address"),
                                                content: TextField(
                                                  controller: ChangeAddress,
                                                ),
                                                actions: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 40),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColors.Peach,
                                                          minimumSize:
                                                              Size(150, 40),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            AddressList[index][
                                                                    "Address"] =
                                                                ChangeAddress
                                                                    .text;
                                                          });

                                                          Navigator.pop(
                                                              context);
                                                          ChangeAddress.clear();
                                                        },
                                                        child: Text("update")),
                                                  )
                                                ],
                                              );
                                            });
                                      });
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 15,
                                      color: Colors.grey[800],
                                    ))
                              ],
                            )),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.only(left: 18, top: 5),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor:
                                AddressList[index]["isborder"] == true
                                    ? AppColors.Peach
                                    : Colors.transparent,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                    ]);
                  }),
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text("Add Address"),
                          content: TextField(
                            controller: AddAddress,
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.Peach,
                                  minimumSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    AddMap['Address'] = AddAddress.text;
                                    AddMap['isborder'] = false;
                                    AddMap['isEditing'] = false;
                                    AddressList.add(AddMap);
                                    AddAddress.clear();
                                  });

                                  Navigator.pop(context);
                                  AddAddress.clear();
                                },
                                child: Text("Add"))
                          ],
                        );
                      });
                });
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.Peach, // Set your desired border color here
                  width: 2.0, // Set the border width
                ),
              ),
              child: CircleAvatar(
                radius: 15, // Set the radius of the circle avatar
                backgroundColor: Colors
                    .transparent, // Set the background color to transparent
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding:EdgeInsets.only(top: 0),
                  child: Icon(
                    Icons.add,
                    color: AppColors.Peach,
                  ),
                ),
              ),
            ),
          ),
          Container(height:250),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.Peach,
                minimumSize: Size(230, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
              child: Row(
                
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                      yourtext: "Checkout        ",
                      fontweight: FontWeight.w500,
                      fontsize: 15,
                      fontColor: AppColors.White),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
