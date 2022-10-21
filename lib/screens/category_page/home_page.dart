import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../cubit/cubit/category_cubit.dart';
import '../products_page/products_page.dart';
import 'category_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories Page")),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var st = state.status;
          var categories = state.categories;

          if (st == FormzStatus.submissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (st == FormzStatus.submissionSuccess) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: List.generate(categories.length, (index) {
                return CategoryItem(
                  categoryModel: categories[index],
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
