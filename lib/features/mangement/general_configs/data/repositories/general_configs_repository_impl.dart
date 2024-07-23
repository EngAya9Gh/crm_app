import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../domain/repositories/general_configs_repository.dart';
import '../../domain/use_cases/edit_general_configs_usecase.dart';
import '../../domain/use_cases/get_general_configs_usecase.dart';
import '../data_sources/general_configs_datasource.dart';

@LazySingleton(as: GeneralConfigsRepository)
class GeneralConfigsRepositoryImpl extends GeneralConfigsRepository {
  final GeneralConfigsDatasource _datasource;

  GeneralConfigsRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<ConfigModel>>> getGeneralConfigs(
    GetGeneralConfigsParams params,
  ) async {
    try {
      final data = await _datasource.getGeneralConfigs(params);
      final configs = List<ConfigModel>.from(data.map((e) {
        return ConfigModel.fromJson(e);
      }));
      return Right(configs);
    } catch (e) {
      debugPrint('error in getGeneralConfigs: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> editGeneralConfigs(
    EditGeneralConfigsParams params,
  ) async {
    try {
      final data = await _datasource.editGeneralConfigs(params);
      return Right(data);
    } catch (e) {
      debugPrint('error in editGeneralConfigs: $e');
      return Left(e.toString());
    }
  }
}
