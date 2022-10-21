// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/get_categories/get_categories_cubit.dart';
import 'package:flutter_exam_five/ui/category_by_id/category_by_id.dart';
import 'package:formz/formz.dart';
import 'dart:developer';

import 'package:intl/intl.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetCategoriesCubit>().getAllCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.status == FormzStatus.submissionSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryByIdScreen(
                              categoryId: state.categories[index].id,
                              nameOfCategory: state.categories[index].name,
                            ),
                          ),
                        )
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                          child: Column(
                            children: [
                              Text(
                                state.categories[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  state.categories[index].imageUrl,
                                  width: 150,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                DateFormat.yMMMEd().format(DateTime.parse(
                                    state.categories[index].createdAt)),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
