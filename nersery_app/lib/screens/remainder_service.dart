import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    const AndroidInitializationSettings androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(android: androidInit);
    _notificationsPlugin.initialize(settings);
  }

  static void scheduleReminder(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'watering_reminder',
      'Plant Watering Reminder',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(0, title, body, details);
  }
}
