import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/dio/dio_init.dart';
import 'di_container.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async =>
    $initGetIt(getIt, environment: 'dev');

@module
abstract class AppModule {
  @Environment("dev")
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @Environment("test")
  @singleton
  Future<SharedPreferences> get sharedPreferencesTest async {
    SharedPreferences.setMockInitialValues({
      "token": "token",
    });
    return SharedPreferences.getInstance();
  }

  @Environment("dev")
  @singleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage(
        aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      );

  @Environment("test")
  @singleton
  FlutterSecureStorage get secureStorageTest {
    FlutterSecureStorage.setMockInitialValues({});
    return FlutterSecureStorage(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @singleton
  Logger get logger => Logger(printer: PrettyPrinter(methodCount: 0));

  @singleton
  Dio get dio => dioInit();

  @lazySingleton
  Location get location => Location();
}
