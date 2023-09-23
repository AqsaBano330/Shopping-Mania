import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hijabista/Lists/CartItem/cartItem.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/cart_screen/cart_screen.dart';
import 'package:hijabista/Widget/add_to_cart/add_to_cart.dart';
import 'package:hijabista/Widget/backButton/Back_Button.dart';
import 'package:hijabista/Widget/color/colors.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _current = 0;
  int index = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                CustomBackButtom(arrowColor: "black"),
                Spacer(),
                AddToCart(CartItem: CartItem, cartColor: 'black'),
              ],
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CarouselSlider(
                items: product.map((productItem) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      productItem["image"],
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
              children: product.asMap().entries.map((entry) {
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
            Row(
              children: [
                Text(product[index]["name"]),
                Spacer(),
                Text(product[index]["price"].toString()),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RatingBar.builder(
                itemSize: 20,
                initialRating: 3,
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
            Expanded(
              child: ListView.separated(
                itemCount: 2, // Two items: Details and Reviews
                separatorBuilder: (context, index) =>
                    SizedBox(height: 0), // No visible separator
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Details ExpansionTile
                    return Card(
                      child: ExpansionTile(
                        title: Text("Details"),
                        collapsedTextColor:
                            Colors.black, // Hide the text initially
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product[index]["details"]),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Reviews ExpansionTile
                    return Card(
                      child: ExpansionTile(
                        title: Text("Reviews"),
                        collapsedTextColor:
                            Colors.black, // Hide the text initially
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product[index - 1][
                                "reviews"]), // Subtract 1 to account for the Details tile
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Check if the item is already in the CartItem list
                final existingItemIndex = CartItem.indexWhere(
                    (item) => item["name"] == product[index]["name"]);

                if (existingItemIndex != -1) {
                  // If the item already exists, increment the "itemamount"
                  setState(() {
                    CartItem[existingItemIndex]["itemamount"]++;
                  });
                } else {
                  // If the item doesn't exist, add it to the CartItem list
                  setState(() {
                    CartItem.add(product[index]
                      // Initialize itemamount to 1
                    );
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
                print(CartItem);
              },
              child: Text("+"),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
