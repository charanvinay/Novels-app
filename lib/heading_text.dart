import 'package:flutter/material.dart';
import 'package:novels_app/colors_values.dart';

class HeadingText extends StatelessWidget {
  final String? text;
  const HeadingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: bc6,
          fontFamily: 'Product Sans',
        ),
      ),
    );
  }
}
