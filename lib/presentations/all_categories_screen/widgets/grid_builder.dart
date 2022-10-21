import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/presentations/all_categories_screen/widgets/category_container.dart';
import 'package:flutter_exam_five/presentations/products_screen/products_screen.dart';


Widget categoriesWidget({required List<CategoryModel> categories}) {
  
  return GridView.builder(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
        crossAxisCount: 2),
    itemCount: categories.length,
    itemBuilder: (context, index) {
      CategoryModel category = categories[index];
      
      return categoryContainer(
          category: category,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductsScreen(
                    category: category,
                  );
                },
              ),
            );
          });
    },
  );
}
