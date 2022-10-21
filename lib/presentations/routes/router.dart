import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      default:
        return navigateTo(const Scaffold(
          body: Center(
            child: Text(
              "404\nNOT FOUND",
              textAlign: TextAlign.center,
            ),
          ),
        ));
    }
  }
}

navigateTo(Widget widget) => MaterialPageRoute(builder: (ctx) => widget);
