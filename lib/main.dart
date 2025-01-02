import 'package:crm_smart/core/config/app_init.dart';
import 'package:crm_smart/services/notification_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'services/service_provider.dart';

@pragma('vm:entry-point')
Future<void> _firebaseOnBackgroundListener(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseOnBackgroundListener);
  await NotificationService.init();
   // NotificationService.requestPermission();
  NotificationService.listen();

  await AppInit.initAll();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ServiceProvider(),
  ));
}
