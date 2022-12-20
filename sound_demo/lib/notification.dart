import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class NotificationPlugin {
  static Future<void> setup() async {
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {},
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void init(BuildContext context) {
    _requestIOSPermissions();
  }

  static void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static AndroidNotificationDetails androidPlatformChannelSpecifics(String body, String sound) =>
      AndroidNotificationDetails(
        '$sound channel id',
        '$sound channel name',
        channelDescription: '$sound channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
        ongoing: true,
        sound: RawResourceAndroidNotificationSound(sound),
        // sound: UriAndroidNotificationSound(sound),
        styleInformation: BigTextStyleInformation(body),
      );

  static DarwinNotificationDetails iOSPlatformChannelSpecifics(String sound) => DarwinNotificationDetails(
        sound: '$sound.mp3',
        presentSound: true,
      );

  static NotificationDetails platformChannelSpecifics(String body, String sound) => NotificationDetails(
        android: androidPlatformChannelSpecifics(body, sound),
        iOS: iOSPlatformChannelSpecifics(sound),
      );

  static Future<bool> showNotification(
    int id,
    String? title,
    String body, {
    String? payload,
    String? cid,
    required String sound,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics(body, sound),
      payload: payload ?? 'undefined',
    );
    return Future.value(true);
  }

  // static Future<void> showNotificationSchedule(int id, String? title, String body, tz.TZDateTime scheduledDate,
  //     {String? payload, String? cid}) async {
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     scheduledDate,
  //     platformChannelSpecifics(body),
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //     androidAllowWhileIdle: true,
  //   );
  // }
}
