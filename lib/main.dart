import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categry_cubit.dart';
import 'package:flutter_exam_five/data/repository/m_repository.dart';
import 'package:flutter_exam_five/views/categorys/categorys.dart';

import 'data/api_services/api_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(create:
    (context) => MyRepository(apiProvider: ApiProvider()),
    child: BlocProvider(
      create: (context)=> CategoryCubit(myRepository: context.read<MyRepository>()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CategoryPage(),
      ),
    ),);
  }
}
