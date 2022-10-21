import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:formz/formz.dart';

class ProductsUI extends StatelessWidget {
  const ProductsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<CategoriesCubit>(context).fetchCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if(state.status == FormzStatus.submissionInProgress){
                return const Center(child: CircularProgressIndicator());
              }
              if(state.status == FormzStatus.submissionFailure){
                return Center(child: Text(state.errorText));
              }
              if(state.status == FormzStatus.submissionSuccess){
                return SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      state.categories.length,
                          (index) => Container(
                            margin: const EdgeInsets.all(16),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: const Offset(1, 3))
                          ],
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.network(state.categories[index].imageUrl),
                              const SizedBox(width: 15),
                              Text(state.categories[index].name),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
