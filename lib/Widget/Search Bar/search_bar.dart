import 'package:flutter/material.dart';
import 'package:hijabista/Lists/productList/productList.dart';
import 'package:hijabista/Widget/color/colors.dart';

List<String> hotSearches = ["Hoodie", "Jacket", "Sweatshirt"];

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List foundProducts = [];
  bool showSuggestions = true;

  @override
  initState() {
    super.initState();
  }

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
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 43,
                child: TextField(
                  onChanged: (value) => runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                    prefix: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
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
                            Container(
                              height: 40,
                              width: 100,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.Peach,
                              ),
                              child: Center(
                                child: Text(
                                  "hi",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ])
                    : foundProducts.isNotEmpty
                        ? ListView.builder(
                            itemCount: foundProducts.length,
                            itemBuilder: (context, index) => Card(
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage(foundProducts[index]['image']),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(foundProducts[index]['name']),
                                subtitle: Text(
                                    '${foundProducts[index]["price"].toStringAsFixed(2)}'), // Format price
                              ),
                            ),
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
