import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../domain/use_cases/get_recommended_client_reports_usecase.dart';
import '../models/recommended_client_model.dart';

abstract class RecommendedClientReportsDatasource {
  Future<ResponseWrapper<List<RecommendClientsReports>>> getRecommendedClientReports();
}

@LazySingleton(as: RecommendedClientReportsDatasource)
class RecommendedClientReportsDatasourceImpl implements RecommendedClientReportsDatasource {
  final ApiServices _api;

  const RecommendedClientReportsDatasourceImpl(this._api);

  @override
  Future<ResponseWrapper<List<RecommendClientsReports>>> getRecommendedClientReports() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.reports.getRecommendedClientReports);

      return ResponseWrapper<List<RecommendClientsReports>>.fromJson(
        response,
        (json) {
          return List.from((json).map((e) {
            return RecommendClientsReports.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    } on BaseAppException catch (e) {
      debugPrint("error in getRecommendedClientReports in datasource => $e");
      throw e.message;
    }
  }
}
