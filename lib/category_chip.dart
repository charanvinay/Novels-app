import 'package:flutter/material.dart';
import 'package:novels_app/colors_values.dart';

class CategoryChip extends StatefulWidget {
  final String categoryName;

  const CategoryChip({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  final List<String> selectedCategories = [];
  late bool s = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Colors.blue[100],
      selected: selectedCategories.contains(widget.categoryName),
      selectedColor: bc6,
      label: Text(
        widget.categoryName,
        style: TextStyle(
          color: s ? Colors.white : Colors.blue[600],
          fontSize: 12,
          fontFamily: 'Product Sans',
          fontStyle: FontStyle.normal,
        ),
      ),
      checkmarkColor: Colors.white,
      onSelected: (bool selected) {
        setState(() {
          s = selected;
          if (selected) {
            selectedCategories.add(widget.categoryName);
          } else {
            selectedCategories.removeWhere((String name) {
              return name == widget.categoryName;
            });
          }
        });
      },
    );
  }
}
