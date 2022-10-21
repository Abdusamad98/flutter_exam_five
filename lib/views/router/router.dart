import 'package:flutter/material.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/views/categories/categories_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
    }
    return null;
  }
}
