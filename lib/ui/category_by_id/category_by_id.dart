// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/get_category_by_id/get_category_by_id_cubit.dart';
import 'package:flutter_exam_five/notification/local_notification.dart';

class CategoryByIdScreen extends StatelessWidget {
  final int categoryId;
  final String nameOfCategory;
  const CategoryByIdScreen(
      {super.key, required this.categoryId, required this.nameOfCategory});

  @override
  Widget build(BuildContext context) {
    context
        .read<GetCategoryByIdCubit>()
        .getCategoryById(categoryId: categoryId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text(
          nameOfCategory,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<GetCategoryByIdCubit, GetCategoryByIdState>(
        listener: (context, state) => {
          if (state is GetCategoryByIdInProgress)
            {
              print("Progress'ga tushdi"),
            }
          else if (state is GetCategoryByIdInSuccess)
            {
              print("Success'ga tushdi"),
            }
          else if (state is GetCategoryByIdInFailure)
            {
              print("Failure'ga tushdi"),
            }
        },
        builder: (context, state) {
          if (state is GetCategoryByIdInProgress) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is GetCategoryByIdInSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .55,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemCount: state.category.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {
                              LocalNotificationService.localNotificationService
                                  .scheduleNotification(15);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.red,
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.category[index].name),
                          SizedBox(height: 7),
                          Text("${state.category[index].price}So'm"),
                          SizedBox(height: 7),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              state.category[index].imageUrl,
                              width: 100,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(state.category[index].description),
                        ],
                      ),
                    ]),
                  );
                },
              ),
            );
          } else if (state is GetCategoryByIdInFailure) {
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
