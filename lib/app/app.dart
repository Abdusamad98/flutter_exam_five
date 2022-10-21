import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products/products_cubit.dart';
import 'package:flutter_exam_five/data/repositories/categories_repository.dart';
import 'package:flutter_exam_five/data/repositories/products_repository.dart';
import 'package:flutter_exam_five/data/services/api_client.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';
import 'package:flutter_exam_five/presentations/all_categories_screen/categories_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider(apiClient: ApiClient());
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CategoriesRepository(apiProvider: apiProvider),
        ),
        RepositoryProvider(
          create: (context) => ProductsRepository(apiProvider: apiProvider),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesCubit(
              categoriesRepository: context.read<CategoriesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductsCubit(
              productsRepository: context.read<ProductsRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesScreen(),
    );
  }
}
