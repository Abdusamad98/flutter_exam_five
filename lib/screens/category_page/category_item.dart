import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:intl/intl.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryModel,
    required this.onTap,
  }) : super(key: key);

  final CategoryModel categoryModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(1, 3),
            color: Colors.grey.shade300,
          )
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: categoryModel.imageUrl,
              width: 130,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryModel.name,
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(categoryModel.createdAt)),
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
