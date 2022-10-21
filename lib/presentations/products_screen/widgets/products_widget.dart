import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/models/product_model/product_model.dart';
import 'package:flutter_exam_five/data/services/local_notification_service.dart';

Widget productsWidget({required List<ProductModel> products}) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemCount: products.length,
    itemBuilder: (context, index) {
      ProductModel product = products[index];
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 10)
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(16)),
              child: Image.network(
                product.imageUrl,
                width: MediaQuery.of(context).size.width * 0.4,
                height: double.infinity,
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {
               LocalNotificationService.localNotificationService
                    .scheduleNotification(15);
            }, icon: const Icon(Icons.shopping_bag,color: Colors.green,)),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    },
  );
}
