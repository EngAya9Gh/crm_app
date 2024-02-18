import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/route.dart';
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../api/log_interceptor.dart';
import 'di_container.config.dart';

final GetIt sl = GetIt.instance;

// normal init of getIt

void setupDependencies() {
  sl.registerLazySingleton<AgentsDistributorsCubit>(
    () => AgentsDistributorsCubit(),
  );
}

final GetIt _getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  // ignoreUnregisteredTypes: [ClientApi],
  // ignoreUnregisteredTypesInPackages:['ClientApi'],
)
Future<GetIt> configureDependencies() async => $initGetIt(_getIt);

@module
abstract class AppModule {
  BaseOptions get dioOption => BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        // headers: <String, String>{
        //   //HttpHeaders.acceptHeader: 'application/json',
        //   // 'Authorization': 'Bearer $token'
        // },
      );

  @singleton
  Logger get logger => Logger();

  @lazySingleton
  Dio dio(BaseOptions option, Logger logger) {
    final dio = Dio(option);
    dio.interceptors.addAll([
      LoggerInterceptor(),
    ]);
    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
