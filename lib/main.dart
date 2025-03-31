import 'dart:async';

import 'package:crm_smart/core/config/app_init.dart';
import 'package:crm_smart/services/notification_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'firebase_options.dart';
import 'services/service_provider.dart';
// Removed the import for 'cubits/search_cubit.dart' as the target URI doesn't exist

@pragma('vm:entry-point')
Future<void> _firebaseOnBackgroundListener(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: kIsWeb ? null : 'smart_crm');
}
 

void main() async {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FirebaseMessaging.onBackgroundMessage(_firebaseOnBackgroundListener);
      await NotificationService.init();
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      // NotificationService.requestPermission();
      NotificationService.listen();

      await AppInit.initAll();

      runApp(DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => ServiceProvider(),
      ));
    },
    (error, stack) async {
      if (!kIsWeb) {
        await FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
        FirebaseCrashlytics.instance.recordError;
      }
    },
  );
}
