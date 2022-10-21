import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/modeles/category_item.dart';
import 'package:intl/intl.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final CategoryItem category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(category.name, style: const TextStyle(color: Colors.black, fontSize: 18)),
                const SizedBox(height: 5),
                Text(DateFormat.yMMMd().format(DateTime.parse(category.createdAt)),
                    style: const TextStyle(color: Colors.green)
                ),
              ],
            ),
            const SizedBox(width: 80),
            CachedNetworkImage(
              imageUrl: category.imageUrl,
              width: 120,
              fit: BoxFit.cover,
            ),

          ],
        ),
      ),
    );
  }
}