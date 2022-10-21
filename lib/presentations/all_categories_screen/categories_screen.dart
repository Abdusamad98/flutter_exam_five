import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories/categories_cubit.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/presentations/all_categories_screen/widgets/grid_builder.dart';
import 'package:formz/formz.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        backgroundColor: CupertinoColors.activeGreen,
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.formzStatus == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.formzStatus == FormzStatus.submissionSuccess) {
            List<CategoryModel> categories = state.categories;
            return categoriesWidget(categories: categories);
          } else if (state.formzStatus == FormzStatus.submissionFailure) {
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
