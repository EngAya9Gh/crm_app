import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/install_quality_repo.dart';
import '../../domain/use_cases/get_install_use_case.dart';
import '../data_sources/install_quality_datasource.dart';

@LazySingleton(as: InstallQualityRepo)
class InstallQualityRepoImpl implements InstallQualityRepo {
  final InstallQualityDatasource _dataSource;

  const InstallQualityRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getInstall(
    GetInstallParams params,
  ) async {
    try {
      final response = await _dataSource.getInstall(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getInstall in repo $e");
      return Left(e.toString());
    }
  }
}
