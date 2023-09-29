import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Home_Page/home_screen.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/text/text.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.details,
    required this.reviews,
    required this.ratings,
    required this.index,
  });

  final String imagePath;
  final String title;
  final String price;
  final String details;
  final String reviews;
  final double ratings;
  final int index;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      child: CustomBackButtom(arrowColor: "black")),
                  Spacer(),
                  AddToCart(CartItem: CartItem, cartColor: "black"),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CarouselSlider(
                items: allproducts.map((productItem) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: allproducts.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, left: 16, bottom: 5),
              child: Row(
                children: [
                  CustomTextWidget(
                    yourtext: widget.title,
                    fontweight: FontWeight.w500,
                    fontsize: 29,
                    fontColor: AppColors.Black,
                  ),
                  Spacer(),
                  CustomTextWidget(
                      yourtext: widget.price.toString(),
                      fontweight: FontWeight.w500,
                      fontsize: 15,
                      fontColor: AppColors.Black),
                  CustomTextWidget(
                      yourtext: "\$",
                      fontweight: FontWeight.w500,
                      fontsize: 15,
                      fontColor: AppColors.Black),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RatingBar.builder(
                  itemSize: 20,
                  initialRating: widget.ratings,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                    }
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Card(
                      child: ExpansionTile(
                        collapsedIconColor: AppColors.Peach,
                        iconColor: AppColors.Peach,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          "Details",
                          style: TextStyle(color: Colors.black),
                        ),
                        collapsedTextColor: Colors.black,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(widget.details),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Card(
                      child: ExpansionTile(
                        title: Text("Reviews"),
                        iconColor: AppColors.Peach,
                        collapsedTextColor: Colors.black,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.reviews,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.Peach,
                    minimumSize: Size(230, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    // Check if the item already exists in the cart
                    final existingItemIndex = CartItem.indexWhere(
                      (item) => item["name"] == widget.title,
                    );

                    if (existingItemIndex != -1) {
                      setState(() {
                        CartItem[existingItemIndex]["itemamount"]++;
                      });
                    } else {
                      setState(() {
                        for (var i = 0; i <= allproducts.length - 1; i++) {
                          if (allproducts[i]["name"] == widget.title) {
                            CartItem.add(allproducts[i]);
                            print(allproducts[i]);
                            print(CartItem);
                            
                          }
                        }
                      });
                    }

                    // Show a SnackBar indicating the item was added to the cart
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item Added to Cart'),
                        action: SnackBarAction(
                          textColor: AppColors.Peach,
                          label: 'View Cart',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextWidget(
                        yourtext: "Add to Cart        ",
                        fontweight: FontWeight.w500,
                        fontsize: 15,
                        fontColor: AppColors.White,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
