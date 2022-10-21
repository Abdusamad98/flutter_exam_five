

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
        required this.name,
        required this.imageURL,
        required this.onTap})
      : super(key: key);

  final String imageURL;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(1, 3))
          ],
        ),
        child: Center(
          child: Row(
            children: [
              Image.network(imageURL),
              const SizedBox(width: 15),
              Text(name),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}