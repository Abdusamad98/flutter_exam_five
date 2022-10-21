import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final LocalNotificationService localNotificationService =
  LocalNotificationService._();

  factory LocalNotificationService() {
    return localNotificationService;
  }

  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void init() {
    // Android
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("app_icon");

    //IOS
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    //Set
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    tz.initializeTimeZones();
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    debugPrint("ON background tap");
  }

// Android
  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse,
      ) async {
    debugPrint("Android onDidRecieveNotification");
  }

  //IOS

  void onDidReceiveLocalNotification(
      int id,
      String? title,
      String? body,
      String? payload,
      ) async {
    debugPrint("IOS onDidRecieveNotification");
  }

  //Initializing channel for Android
  AndroidNotificationChannel androidNotificationChannel =
  const AndroidNotificationChannel(
    "no_idea_channel",
    "Exam task",
    importance: Importance.max,
    description: "My Notification description",
  );

  void showNotification(String data, int id) {
    var random =
    Random(); // keep this somewhere in a static variable. Just make sure to initialize only once.
    int id = random.nextInt(1000);
    flutterLocalNotificationsPlugin.show(
      id,
      "Ibrohim",
      "Bugun darsga borolmayman",
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          priority: Priority.max,
          playSound: true,
          icon: "app_icon",
          showProgress: true,
          largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
        ),
      ),
      payload: data,
    );
  }

  void scheduleNotification(
      {required String title, required String body}) async {
    var random =
    Random(); // keep this somewhere in a static variable. Just make sure to initialize only once.
    int id = random.nextInt(1000);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      "scheduleNotification",
      "EXAMPLE",
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'To remind you about upcoming birthdays',
        ),
      ),
      payload: "No data",
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // It shows notification periodically minute, hour, day etc.
  void showPeriodically() async {
    var random =
    Random(); // keep this somewhere in a static variable. Just make sure to initialize only once.
    int id = random.nextInt(1000);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      'Every minute repeats',
      'Every minute repeats',
      RepeatInterval.everyMinute,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'It shows every single minute',
        ),
      ),
      androidAllowWhileIdle: true,
      payload: "no_root_name",
    );
  }

  // it removes correctly cancels all notifications
  void cancelAllNotifications() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  // It cancels notification by id
  void cancelNotificationById(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}