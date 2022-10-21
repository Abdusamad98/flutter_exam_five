import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/get_categories/get_categories_cubit.dart';
import 'package:flutter_exam_five/cubits/get_category_by_id/get_category_by_id_cubit.dart';
import 'package:flutter_exam_five/ui/home/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => GetCategoryByIdCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CategoriesScreen(),
      ),
    );
  }
}
