import 'package:flutter/material.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Screens/Favorites/fav_icon.dart';
import 'package:hijabista/Widget/color/colors.dart';
import 'package:hijabista/Widget/productDetail/productDetail.dart';
import 'package:hijabista/Widget/text/text.dart';



  List foundProducts = [];

 bool showSuggestions = true;

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {

 

  @override
  // void initState() {
  //   super.initState();
  // }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        foundProducts.clear();
        showSuggestions = true;
      });
    } else {
      List results = allproducts
          .where((product) => product["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      setState(() {
        foundProducts = results;
        showSuggestions = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 43,
                child: TextField(
                  onChanged: (value) => runFilter(value),
                  decoration: InputDecoration(
                    suffixIconColor: Colors.grey[600],
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: AppColors.Black, // Border color when focused
                        width: 2.0, // Border width when focused
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15,
                    ),
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 3, right: 140),
                child: CustomTextWidget(
                  yourtext: "Popular Searches",
                  fontweight: FontWeight.bold,
                  fontsize: 20,
                  fontColor: AppColors.Black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: showSuggestions
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Pullover Hoodie",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Perforamnce Hoodie",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child:const Center(
                                    child: Text(
                                      "Sherpa Hoodie",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sweat Shirt",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                

                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Turtle Neck",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Zip up Hoodie",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Leather Jacket",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Denim Jacket",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 242, 184, 168),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Jacket",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      )
                    : foundProducts.isNotEmpty
                        ? PageView.builder(
                            itemCount: foundProducts.length,
                            padEnds: false,
                            reverse: false,
                            controller: PageController(
                              viewportFraction: 0.5,
                            ),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                            imagePath: foundProducts[index]
                                                ["image"],
                                            title: foundProducts[index]["name"],
                                            
                                            price: foundProducts[index]["price"]
                                                .toString(),
                                            details: foundProducts[index]
                                                ["details"],
                                            reviews: foundProducts[index]
                                                ["reviews"],
                                            ratings: foundProducts[index]
                                                ["ratings"],
                                            index: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 150,
                                      padding: const EdgeInsets.only(top: 4),
                                      margin: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 0,
                                        left: 10,
                                        right: 10,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 170,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    foundProducts[index]["image"]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            child: Text(
                                              foundProducts[index]["name"],
                                              style: const TextStyle(
                                                fontFamily: "Manrope",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Color(0xff1E222B),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 60),
                                                child: CustomTextWidget(
                                                  yourtext: foundProducts[index]
                                                      ["price"]
                                                          .toString(),
                                                  fontweight: FontWeight.w700,
                                                  fontsize: 14,
                                                  fontColor: Colors.black,
                                                ),
                                              ),
                                              const CustomTextWidget(
                                                yourtext: "\$",
                                                fontweight: FontWeight.w700,
                                                fontsize: 14,
                                                fontColor: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: FavIcon(
                                      index: index,
                                    ),
                                  )
                                ],
                              );
                            },
                          )
                        : Container(
                            child: const Text(
                              'No results found. Please try with a different search.',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

