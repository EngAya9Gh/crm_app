import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/cache_services/cache_services.dart';
import '../../../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../domain/use_cases/cache_token_usecase.dart';
import '../../domain/use_cases/get_token_usecase.dart';

abstract class LoginLocalDataSource {
  Future<Either<String, dynamic>> cacheToken(CacheTokenParams cacheTokenParams);

  Future<Either<String, dynamic>> getToken(GetTokenParams getTokenParams);
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final CacheServices _cacheServices;

  LoginLocalDataSourceImpl(
      @Named.from(SecureStorageConsumer) this._cacheServices);

  @override
  Future<Either<String, dynamic>> cacheToken(
    CacheTokenParams cacheTokenParams,
  ) async {
    try {
      await _cacheServices.saveData(
        key: AppStrings.secureStorage.token,
        value: cacheTokenParams.token,
      );
      print("saved token successfully ${getToken(GetTokenParams())} ");
      return Right(null);
    } on BaseAppException catch (e) {
      print("error saving token ${e.message}");
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, dynamic>> getToken(
      GetTokenParams getTokenParams) async {
    try {
      final token =
          await _cacheServices.getData(key: AppStrings.secureStorage.token);
      return Right(token);
    } on BaseAppException catch (e) {
      print("error getting token ${e.message}");
      return Left(e.message);
    }
  }
}
