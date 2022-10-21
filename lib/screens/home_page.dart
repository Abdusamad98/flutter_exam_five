import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/cubit/category_cubit.dart';
import 'package:flutter_exam_five/cubit/cubit/category_state.dart';
import 'package:formz/formz.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategoryProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCategoryInFailure) {
            return Center(child: Text(state.errorText));
          } else if (state is GetCategoryInSuccess) {
            return ListView(
              children: List.generate(state.categories.length, (index) {
                var item = state.categories[index];
                return ListTile(
                  trailing: Image.network(
                    item.imageUrl,
                    width: 190,
                    height: 300,
                  ),
                  title: Text(item.name),
                );
              }),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
