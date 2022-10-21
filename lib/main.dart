import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/shop_cubit.dart';
import 'package:flutter_exam_five/routes/router.dart';
import 'package:flutter_exam_five/service/shop_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ShopService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit(shopService: service),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRouter.home,
        onGenerateRoute: MyRouter.generateRoute,
      ),
    );
  }
}
