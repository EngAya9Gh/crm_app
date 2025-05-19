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
import '../../../features/home/domain/repositories/available_screens_repository.dart';
import '../../../features/home/domain/repositories/favorite_screens_repository.dart';
import '../../../features/home/presentation/manager/favorite_screens_cubit.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

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

  // @preResolve
  // @singleton
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

// @module
// abstract class HomeRepositoryModule {
//   // @lazySingleton
//   // FavoriteScreensRepository provideFavoriteScreensRepository(
//   //   SharedPreferences prefs,
//   // ) =>
//   //     FavoriteScreensRepositoryImpl(prefs);
//
//   // @lazySingleton
//   // AvailableScreensRepository provideAvailableScreensRepository() =>
//   //     AvailableScreensRepositoryImpl();
// }

Future<void> initializeFavoriteScreensCubit(GetIt getIt) async {
  print('[DI] Starting initializeFavoriteScreensCubit');

  // Check if PrivilegesCubit is registered
  try {
    final privilegesCubit = getIt();
    print('[DI] PrivilegesCubit is registered: ${privilegesCubit != null}');
  } catch (e) {
    print('[DI] Error getting PrivilegesCubit: $e');
  }

  if (!getIt.isRegistered<SharedPreferences>()) {
    print('[DI] Registering SharedPreferences');
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);
    print('[DI] SharedPreferences registered successfully');
  } else {
    print('[DI] SharedPreferences already registered');
  }

  // if (!getIt.isRegistered<FavoriteScreensRepository>()) {
  //   print('[DI] Registering FavoriteScreensRepository');
  //   getIt.registerLazySingleton<FavoriteScreensRepository>(
  //     () => FavoriteScreensRepositoryImpl(getIt<SharedPreferences>()),
  //   );
  //   print('[DI] FavoriteScreensRepository registered successfully');
  // } else {
  //   print('[DI] FavoriteScreensRepository already registered');
  // }

  // if (!getIt.isRegistered<AvailableScreensRepository>()) {
  //   print('[DI] Registering AvailableScreensRepository');
  //   getIt.registerLazySingleton<AvailableScreensRepository>(
  //     () => AvailableScreensRepositoryImpl(),
  //   );
  //   print('[DI] AvailableScreensRepository registered successfully');
  // } else {
  //   print('[DI] AvailableScreensRepository already registered');
  // }

  if (!getIt.isRegistered<FavoriteScreensCubit>()) {
    print('[DI] Registering FavoriteScreensCubit');
    try {
      getIt.registerFactory<FavoriteScreensCubit>(
        () => FavoriteScreensCubit(
          getIt<FavoriteScreensRepository>(),
          getIt<AvailableScreensRepository>(),
          getIt<PrivilegesCubit>(),
        ),
      );
      print('[DI] FavoriteScreensCubit registered successfully');
    } catch (e) {
      print('[DI] Error registering FavoriteScreensCubit: $e');
      rethrow; // Rethrow to catch in the calling method
    }
  } else {
    print('[DI] FavoriteScreensCubit already registered');
  }

  print('[DI] Completed initializeFavoriteScreensCubit');
}
