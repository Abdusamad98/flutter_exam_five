import 'package:flutter/material.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/views/categories/categories_screen.dart';
import 'package:flutter_exam_five/views/categories/products/products_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case products:
        return MaterialPageRoute(
          builder: (context) => ProductsScreen(
            categoryName: settings.arguments as String,
          ),
        );
    }
    return null;
  }
}
