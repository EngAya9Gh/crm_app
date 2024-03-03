import 'dart:async';

import 'package:crm_smart/core/api/dio/dio_init.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/end_points.dart';
import 'di_container.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  // ignoreUnregisteredTypes: [ClientApi],
  // ignoreUnregisteredTypesInPackages:['ClientApi'],
)
Future<GetIt> configureDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
  BaseOptions get dioOption => BaseOptions(
        baseUrl: EndPoints.phpUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        // headers: <String, String>{
        //   //HttpHeaders.acceptHeader: 'application/json',
        //   // 'Authorization': 'Bearer $token'
        // },
      );

  @singleton
  Logger get logger => Logger(printer: PrettyPrinter(methodCount: 0));

  @lazySingleton
  Dio dio() => dioInit();
}
