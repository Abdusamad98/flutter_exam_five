import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/category_cubit.dart';
import 'package:flutter_exam_five/cubit/product_cubit.dart';
import 'package:flutter_exam_five/data/servise/category_client.dart';
import 'package:flutter_exam_five/data/servise/category_repository.dart';
import 'package:flutter_exam_five/presentation/category/category_page.dart';
import 'package:flutter_exam_five/utils/notfication/notfiy.dart';
import 'data/repository/category/category_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
