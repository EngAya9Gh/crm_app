import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/common/manager/custom_bloc_observer.dart';
import 'core/services/di/di_container.dart';
import 'core/utils/app_strings.dart';
import 'services/service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initApp();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ServiceProvider(),
  ));
}

Future<void> _initApp() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: kIsWeb
        ? FirebaseOptions(
            apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
            authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '',
            projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
            storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
            messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
            appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
            measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '',
          )
        : null,
  );

  await configureDependencies();
  await getIt.allReady();

  if (!kIsWeb && Platform.isIOS) {
    await Future.wait([
      FirebaseMessaging.instance.requestPermission(),
      _clearSecureStorage(),
    ]);
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = CustomBlocObserver();
  await initializeDateFormatting();
}

@pragma("entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> _clearSecureStorage() async {
  final isFirstTime = await _isFirstTime();
  if (isFirstTime) {
    final secureStorage = getIt<FlutterSecureStorage>();
    await secureStorage.deleteAll();
  }
}

Future<bool> _isFirstTime() async {
  final prefs = getIt<SharedPreferences>();
  if (prefs.getBool(AppStrings.prefs.isFirstTime) != false) {
    await prefs.setBool(AppStrings.prefs.isFirstTime, false);
    return true;
  }
  return false;
}
