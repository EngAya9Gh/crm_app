import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_employees_sales_reports_usecase.dart';

abstract class EmployeesSalesReportsDatasource {
  Future<PaginationResponseWrapper> getEmployeesSalesReports(
    GetEmployeesSalesReportsParams params,
  );
}

@LazySingleton(as: EmployeesSalesReportsDatasource)
class EmployeesSalesReportsDatasourceImpl
    implements EmployeesSalesReportsDatasource {
  final ApiServices _api;

  const EmployeesSalesReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getEmployeesSalesReports(
      GetEmployeesSalesReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getEmployeesSalesReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getEmployeesSalesReports in datasource => $e");
      throw e.message;
    }
  }
}
