import 'package:crm_smart/core/config/app_init.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'services/service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInit.initAll();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ServiceProvider(),
  ));
}

// Future<void> _initApp() async {
//   // await dotenv.load(fileName: ".env");
//
//   // await Firebase.initializeApp(
//   //   options: kIsWeb
//   //       ? FirebaseOptions(
//   //           apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
//   //           authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '',
//   //           projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
//   //           storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
//   //           messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
//   //           appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
//   //           measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '',
//   //         )
//   //       : null,
//   // );
//   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   //
//   // HydratedBloc.storage = await HydratedStorage.build(
//   //   storageDirectory: kIsWeb
//   //       ? HydratedStorage.webStorageDirectory
//   //       : await getApplicationDocumentsDirectory(),
//   // );
//   // Bloc.observer = CustomBlocObserver();
//
//   // await configureDependencies();
//   // await getIt.allReady();
//
//   // if (!kIsWeb && Platform.isIOS) {
//   //   await Future.wait([
//   //     FirebaseMessaging.instance.requestPermission(),
//   //     _clearSecureStorage(),
//   //   ]);
//   // }
//
//   // await initializeDateFormatting();
// }

// @pragma("entry-point")
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// Future<void> _clearSecureStorage() async {
//   final isFirstTime = await _isFirstTime();
//   if (isFirstTime) {
//     final secureStorage = getIt<FlutterSecureStorage>();
//     await secureStorage.deleteAll();
//   }
// }

// Future<bool> _isFirstTime() async {
//   final prefs = getIt<SharedPreferences>();
//   if (prefs.getBool(AppStrings.prefs.isFirstTime) != false) {
//     await prefs.setBool(AppStrings.prefs.isFirstTime, false);
//     return true;
//   }
//   return false;
// }
