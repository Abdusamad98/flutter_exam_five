import 'package:flutter/material.dart';
import 'package:flutter_exam_five/screens/category/categories_page.dart';
import 'package:flutter_exam_five/utils/constants.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categories:
        return MaterialPageRoute(
          builder: (context) => const CategoryPage(),
        );
    }
    return null;
  }
}