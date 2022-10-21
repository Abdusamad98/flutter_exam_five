import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products/products_cubit.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/views/categories/widgets/category_item_view.dart';
import 'package:formz/formz.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product Categories"),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            return Text(state.errorText);
          } else if (state.status == FormzStatus.submissionSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CategoryItemView(
                  categoryModel: state.categories[index],
                  onTap: () {
                    context
                        .read<ProductsCubit>()
                        .getProductsByCatId(id: state.categories[index].id);
                    Navigator.pushNamed(
                      context,
                      products,
                      arguments: state.categories[index].name,
                    );
                  },
                );
              },
              itemCount: state.categories.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
