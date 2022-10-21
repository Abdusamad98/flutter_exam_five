import 'package:flutter/material.dart';
import 'package:flutter_exam_five/view/home_page.dart';
import 'package:flutter_exam_five/view/info_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case info:
        return MaterialPageRoute(builder: (context) => const InfoPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }

  static const String home = '/';
  static const String info = '/home';
}
