import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/cubits/category/category_cubit.dart';
import 'package:flutter_exam_five/data/cubits/product/product_cubit.dart';
import 'package:flutter_exam_five/data/repos/category_repo.dart';
import 'package:flutter_exam_five/data/services/api_client.dart';
import 'package:flutter_exam_five/data/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/ui/categories/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = ApiProvider(apiClient: ApiClient());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryCubit(categoryRepo: CategoryRepo(apiProvider: apiProvider))),
        BlocProvider(create: (_) => ProductCubit(myRepo: CategoryRepo(apiProvider: apiProvider))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoriesPage(),
      ),
    );
  }
}
