import 'dart:developer';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/config/navigator/app_navigator.dart';
import '../features/app/presentation/widgets/app_text.dart';
import '../firebase_options.dart';

@pragma('vm:entry-point')
Future<void> listenBackground(RemoteMessage message) async {
  NotificationService.listen();
}

class NotificationService {
  NotificationService._();

  static final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
    enableVibration: true,

    playSound: true,
  );

  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    var tokenFcm = await getFcmToken(repeat: 3);

    log((tokenFcm).toString(), name: 'FCM Token');
  }

  static Future<String?> getFcmToken({int repeat = 3}) async {
    String? fcmToken;
    try {
      fcmToken = await FirebaseMessaging.instance
          .getToken(vapidKey: kIsWeb ? 'BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg' : null);
    } catch (e) {
      debugPrint('try again');

      if (repeat > 0) {
        Future.delayed(
          Duration(milliseconds: 200),
          () {
            getFcmToken(repeat: repeat - 1);
          },
        );
      }
    }
    return fcmToken;
  }

  static void listen() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        log('$message.contentAvailable');
        log(message.data.toString());
        log('${message.notification?.title}');
        {
          Map<String, dynamic> notification = message.data;
          // AndroidNotification android = message.notification!.android!;
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification['title'],
            notification['body'],
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // color: LightThemeColors.primaryColor,
                playSound: true,
                icon: '@mipmap/launcher_icon',
                importance: Importance.max,
              ),
            ),
          );
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log('///////////////////////////');
        log('$message.contentAvailable');
        log(message.data.toString());
        log('${message.notification?.title}');

        log('///////////////////////////');
        if (kIsWeb) {
          ElegantNotification(
            height: 70,
            title: AppText(
              "New version",
            ),
            description: AppText("A new version is available to you please update."),
            icon: Icon(
              Icons.notifications_active_sharp,
              color: Colors.green,
            ),
            progressIndicatorColor: Colors.green,
          ).show(AppNavigator.navigatorKey.currentContext!);
          return;
        }
        {
          Map<String, dynamic> notification = message.data;
          // AndroidNotification android = message.notification!.android!;
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification['title'],
            notification['body'],
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // color: LightThemeColors.primaryColor,
                playSound: true,
                icon: '@mipmap/launcher_icon',
                importance: Importance.max,
              ),
            ),
          );
        }
      },
    );
  }

  static void requestPermission() {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }
}
