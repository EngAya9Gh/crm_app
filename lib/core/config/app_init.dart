import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart' as urlStrategy;

import '../common/manager/app_bloc_observer.dart';
import '../services/di/di_container.dart';
import '../utils/app_strings.dart';

abstract class AppInit {
  static Future<void> initAll() async {
    urlStrategy.setPathUrlStrategy();

    await Future.wait([
      _initEnvFile(),
      _initBloc(),
    ]);

    await Future.wait([
      _initFireBase(),
      _initServiceLocator(),
    ]);

    await _clearSecureStorage();

    await initializeDateFormatting();
  }

  static Future<void> _initEnvFile() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initFireBase() async {
    FirebaseOptions? options = _prepareFirebaseOptions();
    await Firebase.initializeApp(options: options);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static FirebaseOptions? _prepareFirebaseOptions() {
    final FirebaseOptions? options = kIsWeb
        ? FirebaseOptions(
            apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
            authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '',
            projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
            storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
            messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
            appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
            measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '',
          )
        : null;
    return options;
  }

  @pragma("entry-point")
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static Future<void> _initBloc() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
    Bloc.observer = AppBlocObserver();
  }

  static Future<void> _initServiceLocator() async {
    await configureDependencies();
    await getIt.allReady();
  }

  static Future<void> _clearSecureStorage() async {
    if (!kIsWeb && Platform.isIOS) {
      await Future.wait([
        FirebaseMessaging.instance.requestPermission(),
        _clearSecureStorageIos(),
      ]);
    }
  }

  static Future<void> _clearSecureStorageIos() async {
    final isFirstTime = await _isFirstTime();
    if (isFirstTime) {
      final secureStorage = getIt<FlutterSecureStorage>();
      await secureStorage.deleteAll();
    }
  }

  static Future<bool> _isFirstTime() async {
    final prefs = getIt<SharedPreferences>();
    if (prefs.getBool(AppStrings.prefs.isFirstTime) != false) {
      await prefs.setBool(AppStrings.prefs.isFirstTime, false);
      return true;
    }
    return false;
  }
}
