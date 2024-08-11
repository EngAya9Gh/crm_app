import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_products_sales_reports_usecase.dart';

abstract class ProductsSalesReportsDatasource {
  Future<PaginationResponseWrapper> getProductsSalesReports(
    GetProductsSalesReportsParams params,
  );
}

@LazySingleton(as: ProductsSalesReportsDatasource)
class ProductsSalesReportsDatasourceImpl
    implements ProductsSalesReportsDatasource {
  final ApiServices _api;

  const ProductsSalesReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getProductsSalesReports(
      GetProductsSalesReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getProductsSalesReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getProductsSalesReports in datasource => $e");
      throw e.message;
    }
  }
}
