import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/cubits/product/product_cubit.dart';
import 'package:flutter_exam_five/data/services/notification/local_notification_service.dart';
import 'package:flutter_exam_five/ui/products/widgets/product_item_view.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required this.categoryId,
    required this.categName,
  }) : super(key: key);

  final int categoryId;
  final String categName;

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
      appBar: AppBar(title: Text(widget.categName)),
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
