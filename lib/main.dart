import 'package:crm_smart/core/config/app_init.dart';
import 'package:crm_smart/services/notification_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';
import 'services/service_provider.dart';
@pragma('vm:entry-point')
Future<void> _firebaseOnBackgroundListener(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Map<String, dynamic> notification = message.data;
  // AndroidNotification android = message.notification!.android!;
  NotificationService.flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification['title'],
    notification['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        NotificationService.channel.id,
        NotificationService.channel.name,
        channelDescription: NotificationService.channel.description,
        // color: LightThemeColors.primaryColor,
        playSound: true,
        icon: '@mipmap/launcher_icon',
        importance: Importance.max,
      ),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseOnBackgroundListener);
  await NotificationService.init();
  NotificationService.listen();

  await AppInit.initAll();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ServiceProvider(),
  ));
}
