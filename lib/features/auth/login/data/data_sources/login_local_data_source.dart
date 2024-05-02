import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
      return Right(null);
    } on BaseAppException catch (e) {
      debugPrint("error saving token ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in cacheToken => $e");
      return Left("error in cacheToken");
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
      debugPrint("error getting token ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error getting token => $e");
      return Left("error getting token");
    }
  }
}
