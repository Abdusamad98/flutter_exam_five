import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/product_cubit.dart';
import 'package:flutter_exam_five/presentation/product/widget/product_page_item.dart';
import 'package:flutter_exam_five/utils/notfication/notfiy.dart';

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
            debugPrint("Get Products in Failure");
          } else if (state is GetProductsInSuccess) {
            debugPrint("Get Products in Success");
          } else if (state is GetProductsInProgress) {
            debugPrint("Get Products in Progress");
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
                var pr = products[index];
                return ProductItemView(
                  pr: pr,
                  onIconTap: () {
                    LocalNotificationService.localNotificationService.scheduleNotification(productName: pr.name);
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