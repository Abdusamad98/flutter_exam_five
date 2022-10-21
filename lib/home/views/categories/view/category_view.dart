

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/home/views/categories/category_id/category_id.dart';

import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getData(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryErrorState) {
            const Text("Error State here");
            return;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Category",
                style: TextStyle(
                  fontSize: 30,
                  color: CupertinoColors.activeGreen,
                ),
              ),
              centerTitle: true,
            ),
            body: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryInitialState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CategoryCompletedState) {
                  state.data;
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryIdScreen(),
                                ));
                          },
                          title: Text(
                            state.data[index]["name"],
                            maxLines: 3,
                          ),
                          subtitle: Text(state.data[index]['created_at']),
                          leading: Text(state.data[index]['id'].toString()),
                          trailing:
                              Image.network(state.data[index]['image_url']),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No Internet"),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
