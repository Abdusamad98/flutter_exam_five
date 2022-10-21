import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products_cubit/products_cubit.dart';
import 'package:flutter_exam_five/local/local_notification.dart';
import 'package:flutter_exam_five/ui/widgets/custom_container.dart';
import 'package:flutter_exam_five/ui/widgets/products_container.dart';
import 'package:formz/formz.dart';

class ProductsUI extends StatelessWidget {
  const ProductsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoriesCubit>(context).fetchCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.status == FormzStatus.submissionFailure) {
                return Center(child: Text(state.errorText));
              }
              if (state.status == FormzStatus.submissionSuccess) {
                return SizedBox(
                  height: 100,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      state.categories.length,
                      (index) => CustomContainer(
                        name: state.categories[index].name,
                        imageURL: state.categories[index].imageUrl,
                        onTap: () {
                          BlocProvider.of<ProductsCubit>(context)
                              .fetchProductsByID(
                                  id: state.categories[index].id);
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 10),
          BlocConsumer<ProductsCubit, ProductsState>(
            listener: (context, state) {
              print("xozir ui $state ga o'tdi");
            },
            builder: (context, state) {
              if (state is ProductsInProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductsInFailure) {
                return const Center(child: Text("error"));
              }
              if (state is ProductsInSuccess) {
                return Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(
                      state.products.length,
                      (index) => ProductsContainer(
                        imageURL: state.products[index].imageUrl,
                        name: state.products[index].name,
                        price: state.products[index].price.toString(),
                        onTap: () {
                          LocalNotificationService.localNotificationService.scheduleNotification(15);
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}


