import 'package:firebase_auth_case/core/resources/my_assets/my_assets.dart';
import 'package:firebase_auth_case/core/resources/my_colors/my_colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initializeLocalNotifications() async {
    var initializationSettingsAndroid = AndroidInitializationSettings(
      MyAssets.appIcon,
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestExactAlarmsPermission();
  }

  Future<void> showNotification(RemoteMessage message) async {
    var androidDetails = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      icon: MyAssets.appIcon,
    );
    var platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
    );
  }

  Future<void> showManualNotification(String title, String body) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'manual_channel',
      'Manual Notifications',
      channelDescription: 'Notifications when button clicked',
      importance: Importance.max,
      priority: Priority.high,
      icon: MyAssets.appIcon,
      playSound: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap(MyAssets.appIcon),
      color: MyColors.white,
      ongoing: false,
      autoCancel: false,
      styleInformation: BigTextStyleInformation(body),
    );

    var platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      platformDetails,
    );
  }
}
