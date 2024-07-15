import 'package:crm_smart/features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../domain/repositories/advanced_configs_repository.dart';
import '../../domain/use_cases/get_advanced_configs_usecase.dart';
import '../data_sources/advanced_configs_datasource.dart';

@LazySingleton(as: AdvancedConfigsRepository)
class AdvancedConfigsRepositoryImpl extends AdvancedConfigsRepository {
  final AdvancedConfigsDatasource _datasource;

  AdvancedConfigsRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<ConfigModel>>> getAdvancedConfigs(
    GetAdvancedConfigsParams params,
  ) async {
    try {
      final data = await _datasource.getAdvancedConfigs(params);
      final configs = List<ConfigModel>.from(data.map((e) {
        return ConfigModel.fromJson(e);
      }));
      return Right(configs);
    } catch (e) {
      debugPrint('error in getAdvancedConfigs: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> editAdvancedConfigs(
      EditAdvancedConfigsParams params) async {
    try {
      final data = await _datasource.editAdvancedConfigs(params);
      return Right(data);
    } catch (e) {
      debugPrint('error in editAdvancedConfigs: $e');
      return Left(e.toString());
    }
  }
}
