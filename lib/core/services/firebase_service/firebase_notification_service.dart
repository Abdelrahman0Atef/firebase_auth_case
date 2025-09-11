import 'dart:io';

import 'package:firebase_auth_case/core/services/notification_service/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseNotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification({required String personID}) async {

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await Future.delayed(Duration(seconds: 3));
    String? token;
    try {
      token = await _firebaseMessaging.getToken();
      debugPrint('Firebase token: $token');
    } catch (e) {
      debugPrint('Error getting token: $e');
    }
    //String? token = await _firebaseMessaging.getToken();
    debugPrint('token $token');

    await _subscribeToTopicWithRetry(personID);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService().showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationService().showNotification(message);
    });
  }

  Future<void> subscribeToTestTopic() async {
    await _firebaseMessaging.subscribeToTopic('test');
  }

  Future<void> _subscribeToTopicWithRetry(String personID) async {
    final messaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      String? apnsToken = await messaging.getAPNSToken();

      if (apnsToken == null) {
        await Future<void>.delayed(const Duration(seconds: 3));
        apnsToken = await messaging.getAPNSToken();
      }

      if (apnsToken != null) {
        await messaging.subscribeToTopic(personID);
      } else {
        print('❗️APNs token not available after retry. Skipping topic subscription.');
      }
    } else {
      await messaging.subscribeToTopic(personID);
    }
  }
}
