import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //make instace from  FlutterLocalNotificatuion plugin.
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static ontap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
        initializationSettings, //initialization of flutter local notifications.
        onDidReceiveNotificationResponse: ontap,
        onDidReceiveBackgroundNotificationResponse: ontap);
  }

  static showbasicNotification({required String massBody}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      iOS:
          DarwinNotificationDetails(), //Notification apper when you entePr page or click on button once
      android: AndroidNotificationDetails('channel_id', 'channel_name',
          priority: Priority.high, importance: Importance.max),
    );
    await flutterLocalNotificationsPlugin.show(
      0, //id of the notification massage
      'Himit', //title of the notification
      massBody, //body of the notification
      notificationDetails,
    );
  }

  static showReapetedNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      iOS:
          DarwinNotificationDetails(), // Notification that repeate it self after time you give it
      android: AndroidNotificationDetails('channel_id', 'channel_name',
          priority: Priority.high, importance: Importance.max),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Docdoc',
      "صلي علي النبي",
      RepeatInterval.hourly,
      notificationDetails,
    );
  }

  static void delectNotification(int id) {
    //fun to delete the notification by the id
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
