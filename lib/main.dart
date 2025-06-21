import 'dart:async';
import 'dart:io';

import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/config/app_init.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/firebase_analytics_services.dart';
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
late var lastDuation;

@pragma('vm:entry-point')
Future<void> _firebaseOnBackgroundListener(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Check if Firebase is already initialized
  try {
    Firebase.app();
  } catch (e) {
    // Firebase not initialized, initialize it
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  
  await NotificationService.init();
  // Only enable Crashlytics on mobile platforms
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  // NotificationService.requestPermission();
  NotificationService.listen();

  await AppInit.initAll();
  await HelperFunctions().incrementBadge();
  debugPrint('yessssssssssssssssssssssss');
}

void main() async {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  lastDuation = DateTime.now();
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //       await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      //   name: kIsWeb ? null : 'smart_crm',
      // );

      // Check if Firebase is already initialized (for macOS/iOS native initialization)
      try {
        Firebase.app();
      } catch (e) {
        // Firebase not initialized, initialize it
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
      
      FirebaseMessaging.onBackgroundMessage(_firebaseOnBackgroundListener);
      await NotificationService.init();
      // Only enable Crashlytics on mobile platforms
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      }
      // NotificationService.requestPermission();
      NotificationService.listen();

      await AppInit.initAll();

      runApp(DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => ServiceProvider(),
      ));
    },
    (error, stack) async {
      // Only use Crashlytics on supported platforms
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        await FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      } else {
        // For other platforms, just print the error
        debugPrint('Error: $error');
        debugPrint('Stack: $stack');
      }
    },
  );
}
