import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:intl/intl.dart';

Widget categoryContainer(
    {required CategoryModel category, required VoidCallback onTap}) {
  String time = DateFormat.yMEd().format(DateTime.parse(category.createdAt));
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 10)
        ],
        color: CupertinoColors.activeGreen,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                category.imageUrl,
              ),
            ),
          ),
          Text(
            category.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.white),
          ),
          verticalSpace(5),
        ],
      ),
    ),
  );
}

Widget verticalSpace(double height) => SizedBox(
      height: height,
    );
