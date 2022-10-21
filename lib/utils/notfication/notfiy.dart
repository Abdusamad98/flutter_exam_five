import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final LocalNotificationService localNotificationService = LocalNotificationService._();

  factory LocalNotificationService() {
    return localNotificationService;
  }

  LocalNotificationService._();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void init() async {
    // Android
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

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

    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    tz.initializeTimeZones();
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    // handle action
  }

  // Android
  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  //IOS

  void onDidReceiveLocalNotification(
      int id,
      String? title,
      String? body,
      String? payload,
      ) async {
    print(payload);
  }

  //channel
  AndroidNotificationChannel androidNotificationChannel = const AndroidNotificationChannel(
    "my_channel",
    "Notification Lesson",
    importance: Importance.max,
    description: "My Notification description",
  );

  // void showNotification(RemoteMessage remoteMessage) {
  //   flutterLocalNotificationsPlugin.show(
  //     1,
  //     remoteMessage.notification!.title,
  //     remoteMessage.notification!.body,
  //
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         androidNotificationChannel.id,
  //         androidNotificationChannel.name,
  //         priority: Priority.max,
  //         playSound: true,
  //         icon: "app_icon",
  //         showProgress: true,
  //         largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
  //       ),
  //     ),
  //     payload: remoteMessage.data.toString(),
  //   );
  // }

  void scheduleNotification({required String productName}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      "Saved Product",
      productName,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'You saved one product',
        ),
      ),
      payload: "Notification DATA",
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation
          .absoluteTime,
    );
  }
}
