import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/common/manager/custom_bloc_observer.dart';
import 'core/services/di/di_container.dart';
import 'services/service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runApp(ServiceProvider());
}

Future<void> _initApp() async {
  await Firebase.initializeApp();

  await configureDependencies();

  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission();
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Bloc.observer = CustomBlocObserver();
  await initializeDateFormatting();
}

@pragma("entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
