part of '../home_imports.dart';

class HomeViewModel extends ChangeNotifier {
  String? _selectedTopic;
  FirebaseAnalyticsServices firebaseAnalyticsServices = FirebaseAnalyticsServices();

  void pressTime(){
    firebaseAnalyticsServices.log(
      'topic_button_pressed',
      params: {
        'time': DateTime.now().toIso8601String(),
        'topic': _selectedTopic ?? 'none',
      },
    );
  }

  Future<void> _changeTopic(String newTopic) async {
    if (_selectedTopic != null) {
      await FirebaseMessaging.instance.unsubscribeFromTopic(_selectedTopic!);
    }

    await FirebaseMessaging.instance.subscribeToTopic(newTopic);
    _selectedTopic = newTopic;
    notifyListeners();
  }

  void _sendLocalNotification() {
    NotificationService().showManualNotification(
      MyStrings.test,
      '${MyStrings.subscribedTopic} $_selectedTopic',
    );
  }
}
