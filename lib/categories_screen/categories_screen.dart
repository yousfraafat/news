import 'package:flutter/material.dart';
import 'package:news/categories_screen/category_item.dart';
import 'package:news/api/models/category.dart';

typedef CategoryClick = void Function(NewsCategory);

class CategoriesScreen extends StatelessWidget {
  CategoryClick categoryClick;

  CategoriesScreen({super.key, required this.categoryClick});

  List<NewsCategory> categories = NewsCategory.getCategoryList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category \nof interest',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      categoryClick(categories[index]);
                    },
                    child: CategoryItem(
                      category: categories[index],
                      index: index,
                    ),
                  ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
