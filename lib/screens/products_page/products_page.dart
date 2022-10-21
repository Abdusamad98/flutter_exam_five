import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/screens/products_page/product_item.dart';
import 'package:flutter_exam_five/service/local_notification_service.dart';
import '../../cubit/product_cubit/product_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  final int categoryId;
  final String categoryName;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context)
        .getAllCategoryProducts(id: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is GetProductsInFailure) {
            debugPrint("GET PRODUCTS IN FAILURE");
          } else if (state is GetProductsInSuccess) {
            debugPrint("GET PRODUCTS IN SUCCESS");
          } else if (state is GetProductsInProgress) {
            debugPrint("GET PRODUCTS IN PROGRESS");
          }
        },
        builder: (context, state) {
          if (state is GetProductsInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsInSuccess) {
            var products = state.products;
            return GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: List.generate(products.length, (index) {
                var poducts = products[index];
                return ProductItem(
                  productModel: poducts,
                  onIconTap: () {
                    LocalNotificationService.localNotificationService
                        .scheduleNotification(15, productName: poducts.name);
                  },
                );
              }),
            );
          } else if (state is GetProductsInFailure) {
            return Center(child: Text(state.errorText));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
