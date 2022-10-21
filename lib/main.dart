import 'package:flutter/material.dart';
import 'package:flutter_exam_five/data/services/notification/local_notification_service.dart';
import 'package:flutter_exam_five/utils/constants.dart';
import 'package:flutter_exam_five/views/router/router.dart';

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
