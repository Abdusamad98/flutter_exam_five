

import 'package:flutter/material.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({
    Key? key,
    required this.imageURL,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String imageURL;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(1, 3),
            )
          ]),
      child: Row(
        children: [
          Image.network(
            imageURL,
            fit: BoxFit.contain,
            width: 150,
          ),
          Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Text(
                "\$ $price",
                style: const TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}