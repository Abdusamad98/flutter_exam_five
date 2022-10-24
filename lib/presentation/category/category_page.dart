import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/category_cubit.dart';
import 'package:flutter_exam_five/modeles/state.dart';
import 'package:flutter_exam_five/presentation/category/widget/category_page_item.dart';
import 'package:flutter_exam_five/presentation/product/product_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var st = state.myState;
          var categories = state.categories;

          if (st == MyState.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (st == MyState.SUCCESS) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: List.generate(categories.length, (index) {
                return CategoriesItem(
                  category: categories[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductsPage(
                          categoryId: categories[index].id,
                          categoryName: categories[index].name,
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          } else {
            return Center(child: Text(state.errorText));
          }
        },
      ),
    );
  }
}
