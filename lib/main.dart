import 'package:flutter/material.dart';
import 'package:flutter_exam_five/app/app.dart';
import 'package:flutter_exam_five/data/services/local_notification_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.localNotificationService.init();
  runApp(const App());
}
