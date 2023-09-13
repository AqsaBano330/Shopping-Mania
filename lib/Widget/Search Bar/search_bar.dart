import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48, // Increase the height to your desired size
      width: 300, // Increase the width to your desired size
      decoration: BoxDecoration(
        color: Colors.purple[800], // Set dark purple background color
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.grey[400], // Set placeholder text color
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12.0), // Adjust vertical padding
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey), // Set search icon
          prefixIconConstraints: BoxConstraints(
            minWidth: 48, // Adjust the width to position the icon as desired
            minHeight: 48, // Adjust the height to position the icon as desired
          ),
        ),
      ),
    );
  }
}
