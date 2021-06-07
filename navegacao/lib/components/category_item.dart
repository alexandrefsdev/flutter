import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
      decoration: BoxDecoration(
        
      ),
    );
  }
}
