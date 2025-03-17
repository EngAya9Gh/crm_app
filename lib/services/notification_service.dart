import 'dart:developer';

import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/config/app_dynamic_links.dart';
import '../core/config/navigator/app_navigator.dart';
import '../features/app/presentation/widgets/app_text.dart';
import '../features/notifications/presentation/manager/notifications_cubit.dart';
import '../firebase_options.dart';
import '../view_model/user_vm_provider.dart';

class NotificationService {
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
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: kIsWeb ? null : 'smart_crm');
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
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        log('///////////////////////////');
        log('$message.contentAvailable');
        log(message.data.toString());
        log('${message.notification?.title}');
        Map<String, dynamic> notification = message.data;
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            message.notification?.title,
            message.notification?.body,
            NotificationDetails(
              iOS: DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              ),
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                playSound: true,
                icon: '@mipmap/launcher_icon',
                importance: Importance.max,
              ),
            ));
        String? typeNotify = message.data['type_notify'];
        if (message.data['title'] == "مهمة جديدة" || typeNotify == 'commentMention') {
          AppNavigator.navigatorKey.currentContext?.read<UserProvider>().getCurrentUser();
        }
        AppDynamicLinks.routeNotifyTo(typeNotify, AppNavigator.navigatorKey.currentContext, message.data, null);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        log('$message.contentAvailable');
        log(message.data.toString());
        log('${message.notification?.title}');
        {
          String? typeNotify = message.data['type_notify'];
          if (message.data['title'] == "مهمة جديدة") {
            AppNavigator.navigatorKey.currentContext?.read<UserProvider>().getCurrentUser();
          }
          AppDynamicLinks.routeNotifyTo(typeNotify, AppNavigator.navigatorKey.currentContext, message.data, null);
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        String? typeNotify = message.data['type_notify'];
        if (message.data['title'] == "مهمة جديدة" || typeNotify == 'commentMention') {
          AppNavigator.navigatorKey.currentContext?.read<UserProvider>().getCurrentUser();
        }
        log('///////////////////////////');
        log('$message.contentAvailable');
        log(message.data.toString());
        log('${message.notification?.title}');
        AppNavigator.navigatorKey.currentContext!.read<NotificationsCubit>().init();
        AppNavigator.navigatorKey.currentContext!.read<NotificationsCubit>().increaseNotificationCount();
        log('///////////////////////////');
        if (kIsWeb) {
          ElegantNotification(
            height: 70,
            title: AppText(
              message.notification?.title,
            ),
            description: AppText(message.notification?.body),
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
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            message.notification?.title,
            message.notification?.body,
            NotificationDetails(
              iOS: DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              ),
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
