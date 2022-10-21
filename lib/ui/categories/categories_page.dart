import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/cubits/category_cubit.dart';
import 'package:flutter_exam_five/data/models/my_state.dart';
import 'package:flutter_exam_five/ui/categories/widgets/categ_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories Page")),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var st = state.myState;
          var categories = state.categories;

          if (st == MyState.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (st == MyState.SUCCESS) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: List.generate(categories.length, (index) {
                return CategItem(
                  categ: categories[index],
                  onTap: () {},
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
