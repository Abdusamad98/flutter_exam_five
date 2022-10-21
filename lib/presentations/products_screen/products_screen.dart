import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/products/products_cubit.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/models/product_model/product_model.dart';
import 'package:flutter_exam_five/presentations/products_screen/widgets/products_widget.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key, required this.category});
  CategoryModel category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsCubit>().fetchProducts(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        backgroundColor: CupertinoColors.activeGreen,
        centerTitle: true,
        title: const Text("Products"),
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        builder: (context, state) {
          if (state is GetProductsInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is GetProductsInSuccess) {
            List<ProductModel> products = state.products;
            return productsWidget(products: products);
          } else if (state is GetProductsInFailure) {
            return Center(
              child: Text(state.errorText),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
