import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/category/category_model.dart';
import 'package:flutter_exam_five/utils/style.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({
    Key? key,
    required this.categoryModel,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(1, 3),
                color: Colors.grey.shade300,
              )
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
                child: CachedNetworkImage(
                  imageUrl: categoryModel.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      period: const Duration(seconds: 1),
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.white12,
                      child: Container(
                        width: 120,
                        height: 100,
                        color: Colors.white,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error_sharp),
                ),
              ),
            ),
            Expanded(
              child: Text(
                categoryModel.name,
                textAlign: TextAlign.center,
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}