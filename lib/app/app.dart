import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories/categories_cubit.dart';
import 'package:flutter_exam_five/data/repositories/categories_repository.dart';
import 'package:flutter_exam_five/data/services/api_client.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';
import 'package:flutter_exam_five/presentations/all_categories_screen/categories_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider(apiClient: ApiClient());
    return RepositoryProvider(
      create: (context) => CategoriesRepository(apiProvider: apiProvider),
      child: BlocProvider(
        create: (context) => CategoriesCubit(
          categoriesRepository: context.read<CategoriesRepository>(),
        ),
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreen(),
    );
  }
}
