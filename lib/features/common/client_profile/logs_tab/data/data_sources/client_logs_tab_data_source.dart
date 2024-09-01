import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_client_logs_usecase.dart';

abstract interface class ClientLogsTabDataSource {
  Future<PaginationResponseWrapper> getClientLogs(
    GetClientLogsParams params,
  );
}

@LazySingleton(as: ClientLogsTabDataSource)
class SupportTabDataSourceImpl implements ClientLogsTabDataSource {
  final ApiServices _apiServices;

  SupportTabDataSourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getClientLogs(
    GetClientLogsParams params,
  ) async {
    return PaginationResponseWrapper(
      data: [],
    );
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.client.getInvoiceByIdClient(params.idClient),
        // queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientLogs => ${e.message}");
      throw e.message;
    }
  }
}
