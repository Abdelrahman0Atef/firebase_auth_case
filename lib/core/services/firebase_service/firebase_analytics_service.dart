import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsServices{
  final _firebaseAnalytics = FirebaseAnalytics.instance;

  Future<void> logScreen(String name) =>
      _firebaseAnalytics.logScreenView(screenName: name);

  Future<void> log(String name, {Map<String, Object>?  params}) =>
      _firebaseAnalytics.logEvent(name: name, parameters: params);
}