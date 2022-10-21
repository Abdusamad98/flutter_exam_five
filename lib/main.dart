import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products_cubit/products_cubit.dart';
import 'package:flutter_exam_five/data/api/api_client.dart';
import 'package:flutter_exam_five/data/api/api_provider.dart';
import 'package:flutter_exam_five/data/repositories/repository.dart';
import 'package:flutter_exam_five/ui/products_ui.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   App({Key? key}) : super(key: key);

  final ApiProvider apiProvider = ApiProvider(apiClient: ApiClient());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MyRepository>(
          create: (_) => MyRepository(apiProvider: apiProvider),
        ),
      ], child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CategoriesCubit(myRepository: context.read<MyRepository>()),
        ),
        BlocProvider(
          create: (BuildContext context) => ProductsCubit(myRepository: context.read<MyRepository>()),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsUI(),
    );
  }
}
