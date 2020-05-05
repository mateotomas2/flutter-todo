import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future removeNotification(int id) async {
  new FlutterLocalNotificationsPlugin().cancel(id);
}

void initializeNotifications(context) {
  Future onSelectNotification(String payload) async {

  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  var initializationSettingsAndroid =
      new AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);

  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}

