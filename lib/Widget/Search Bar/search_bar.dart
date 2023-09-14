import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48, // Increase the height to your desired size
      width: 300, // Increase the width to your desired size
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 174, 53, 46), // Set dark purple background color
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.grey[300], // Set placeholder text color
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 12.0), // Adjust vertical padding
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey[300]), // Set search icon
            prefixIconConstraints: const BoxConstraints(
              minWidth: 48, 
              minHeight: 48, 
            ),
          ),
        ),
      ),
    );
  }
}
