import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/product_model/products.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
    required this.onIconTap,
  }) : super(key: key);

  final ProductModel productModel;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(1, 1),
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
                  imageUrl: productModel.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      productModel.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${productModel.price.toString()} \$",
                      style: const TextStyle(
                        color: Colors.black,
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
                Icons.heart_broken,
                color: Colors.red,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
