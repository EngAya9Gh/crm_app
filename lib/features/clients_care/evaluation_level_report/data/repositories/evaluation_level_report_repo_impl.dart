import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/evaluation_level_report_repo.dart';
import '../../domain/use_cases/get_evaluation_level_report_usecase.dart';
import '../data_sources/evaluation_level_report_datasource.dart';

@LazySingleton(as: EvaluationLevelReportRepo)
class EvaluationLevelReportRepoImpl implements EvaluationLevelReportRepo {
  final EvaluationLevelReportDatasource _dataSource;

  const EvaluationLevelReportRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getEvaluationLevelReport(
    GetEvaluationLevelReportParams params,
  ) async {
    try {
      final response = await _dataSource.getEvaluationLevelReport(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getEvaluationLevelReport in repo $e");
      return Left(e.toString());
    }
  }
}
