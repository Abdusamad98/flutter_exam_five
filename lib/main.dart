import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories/categories_cubit.dart';
import 'package:flutter_exam_five/data/repositories/categories_repository.dart';
import 'package:flutter_exam_five/data/repositories/products_repository.dart';
import 'package:flutter_exam_five/data/services/api/open_api/open_api_client.dart';
import 'package:flutter_exam_five/data/services/api/open_api/open_api_service.dart';
import 'package:flutter_exam_five/data/services/notification/local_notification_service.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/views/router/router.dart';

import 'cubits/products/products_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService.init();
  OpenApiService openApiService =
      OpenApiService(openApiClient: OpenApiClient());
  // I will not use Multi repository. However I don't need to it.
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            categoriesRepository: CategoriesRepository(
              openApiService: openApiService,
            ),
          )..getCategories(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(
            productsRepository: ProductsRepository(
              openApiService: openApiService,
            ),
          ),
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
        primarySwatch: Colors.blue,
      ),
    );
  }
}
