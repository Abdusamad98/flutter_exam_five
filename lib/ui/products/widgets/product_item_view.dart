import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/product/product_item.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({
    Key? key,
    required this.pr,
    required this.onIconTap,
  }) : super(key: key);

  final ProductItem pr;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(1, 3),
            color: Colors.grey.shade300,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: pr.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      pr.name,
                      style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${pr.price.toString()} \$",
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: onIconTap,
              icon: const Icon(
                Icons.add_business,
                color: Colors.deepOrange,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
