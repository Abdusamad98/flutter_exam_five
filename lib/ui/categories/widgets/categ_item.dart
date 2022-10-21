import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/category/category_item.dart';
import 'package:intl/intl.dart';

class CategItem extends StatelessWidget {
  const CategItem({
    Key? key,
    required this.categ,
    required this.onTap,
  }) : super(key: key);

  final CategoryItem categ;
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
            CachedNetworkImage(
              imageUrl: categ.imgUrl,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categ.name, style: const TextStyle(color: Colors.black, fontSize: 18)),
                const SizedBox(height: 10),
                Text(DateFormat.yMMMd().format(DateTime.parse(categ.createdAt)),
                  style: const TextStyle(color: Colors.red)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
