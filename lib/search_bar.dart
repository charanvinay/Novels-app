import 'package:flutter/material.dart';
import 'package:novels_app/colors_values.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [bc5, bc6])),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextField(
        style: new TextStyle(color: Colors.blue),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.search, color: Colors.blue),
            hintText: "What are you looking for?",
            hintStyle: TextStyle(
              color: Colors.black12,
              fontFamily: 'Product Sans',
            )),
      ),
    );
  }
}
