import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/all_category_cubit.dart';
import 'package:flutter_exam_five/cubit/single_category_cubit.dart';
import 'package:flutter_exam_five/view/all_category_page.dart';
import 'data/local/storage.dart';
import 'data/repositories/books_repository.dart';
import 'data/services/api_client.dart';
import 'data/services/api_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => AllCategoryCubit(
          repository: Repository(
            apiProvider: ApiProvider(apiClient: ApiClient()),
          ),
        ),
      ),
      BlocProvider(
          create: (_) => SingleCategoryCubit(
              repository:
                  Repository(apiProvider: ApiProvider(apiClient: ApiClient()))))
    ], child: const Splash());
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllCategoryPage(),
    );
  }
}
