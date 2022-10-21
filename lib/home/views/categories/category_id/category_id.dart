import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryIdScreen extends StatelessWidget {
  const CategoryIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category Id",
          style: TextStyle(
            color: CupertinoColors.systemGreen,
          ),
        ),elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: CupertinoColors.systemGreen),
      ),
    );
  }
}
