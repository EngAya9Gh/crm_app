import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../domain/repositories/levels_repo.dart';
import '../../domain/use_cases/add_level_usecase.dart';
import '../../domain/use_cases/get_levels_usecase.dart';
import '../data_sources/levels_datasource.dart';
import '../models/level_model.dart';

@LazySingleton(as: LevelsRepo)
class LevelsRepoImpl implements LevelsRepo {
  final LevelsDatasource _dataSource;

  LevelsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getLevels(
    GetLevelsParams params,
  ) async {
    try {
      final data = await _dataSource.getLevels(params);
      return Right(data.copyWith(
        data: data.data
            .map<LevelModel>((e) => LevelModel.fromMap(e))
            .clientsSubsectionsNamesList(),
      ));
    } catch (e) {
      debugPrint("error in getLevels in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> addLevel(
    AddLevelParams params,
  ) async {
    try {
      final data = await _dataSource.addLevel(params);
      return Right(data);
    } catch (e) {
      debugPrint("error in addLevel in repo => $e");
      return Left(e.toString());
    }
  }
}
