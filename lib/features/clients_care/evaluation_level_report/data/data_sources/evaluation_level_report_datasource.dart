import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_evaluation_level_report_usecase.dart';

abstract class EvaluationLevelReportDatasource {
  Future<PaginationResponseWrapper> getEvaluationLevelReport(
    GetEvaluationLevelReportParams params,
  );
}

@LazySingleton(as: EvaluationLevelReportDatasource)
class EvaluationLevelReportDatasourceImpl
    implements EvaluationLevelReportDatasource {
  final ApiServices _api;

  const EvaluationLevelReportDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getEvaluationLevelReport(
    GetEvaluationLevelReportParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getEvaluationLevelReport,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getEvaluationLevelReport in datasource => $e");
      throw e.message;
    }
  }
}
