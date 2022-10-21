import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products_cubit/products_cubit.dart';
import 'package:flutter_exam_five/data/my_repository/my_repository.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';
import 'package:flutter_exam_five/data/services/local_notification_service.dart';
import 'package:flutter_exam_five/pages/main_page.dart';

// categories
// https://third-exam.free.mockoapp.net/categories
//products
// https://third-exam.free.mockoapp.net/categories/{id}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            myRepository: MyRepository(apiProvider: ApiProvider()),
          ),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(
            myRepository: MyRepository(apiProvider: ApiProvider()),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
