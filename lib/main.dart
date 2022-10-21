import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/repostory/category_repostory.dart';
import 'package:flutter_exam_five/screens/category_page/home_page.dart';
import 'package:flutter_exam_five/service/local_notification_service.dart';
import 'cubit/cubit/category_cubit.dart';
import 'cubit/product_cubit/product_cubit.dart';
import 'data/api/api_client.dart';
import 'data/api/api_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = ApiProvider(apiClient: ApiClient());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CategoryCubit(
                categoryRepository:
                    CategoryRepository(apiProvider: apiProvider))),
        BlocProvider(
            create: (_) => ProductCubit(
                categoryRepository:
                    CategoryRepository(apiProvider: apiProvider))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
