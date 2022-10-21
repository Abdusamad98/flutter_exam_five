import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/category/categories_cubit.dart';
import 'package:flutter_exam_five/data/repository/categories_repository.dart';
import 'package:flutter_exam_five/services/api/api_client.dart';
import 'package:flutter_exam_five/services/api/api_service.dart';
import 'package:flutter_exam_five/services/local_notification/local_notification.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService.init();
  ApiService apiService =
  ApiService(apiClient: ApiClient());
  // I will not use Multi repository. However I don't need to it.
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            categoriesRepository: CategoriesRepository(
              apiService: apiService,
            ),
          )..getCategories(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: categories,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}