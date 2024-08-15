import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_regions_sales_reports_usecase.dart';

abstract class RegionsSalesReportsDatasource {
  Future<PaginationResponseWrapper> getRegionsSalesReports(
    GetRegionsSalesReportsParams params,
  );
}

@LazySingleton(as: RegionsSalesReportsDatasource)
class RegionsSalesReportsDatasourceImpl
    implements RegionsSalesReportsDatasource {
  final ApiServices _api;

  const RegionsSalesReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getRegionsSalesReports(
      GetRegionsSalesReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getRegionsSalesReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getRegionsSalesReports in datasource => $e");
      throw e.message;
    }
  }
}
