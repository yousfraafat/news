import 'package:flutter/material.dart';
import 'package:news/api/models/category.dart';

class CategoryItem extends StatelessWidget {
  NewsCategory category;
  int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath),
          Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
