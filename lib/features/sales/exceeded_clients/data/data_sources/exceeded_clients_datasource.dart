import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/exceeded_clients_use_case.dart';
import '../../domain/use_cases/transfer_exceeded_clients_use_case.dart';

abstract class ExceededClientsDatasource {
  Future<PaginationResponseWrapper> getExceededClients(
    ExceededClientsParams params,
  );

  Future<PaginationResponseWrapper> transferExceededClients(
    TransferExceededClientsParams params,
  );
}

@LazySingleton(as: ExceededClientsDatasource)
class ExceededClientsDatasourceImpl implements ExceededClientsDatasource {
  final ApiServices _api;

  const ExceededClientsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getExceededClients(
    ExceededClientsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.client.exceededClients,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper(
        data: apiDataHandler(response),
        count: response['count'],
      );
    } on BaseAppException catch (e) {
      debugPrint("error in getExceededClients: $e");
      throw e.message;
    }
  }

  @override
  Future<PaginationResponseWrapper> transferExceededClients(
    TransferExceededClientsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.client.transferExceededClients,
        data: params.toBody(),
      );

      return PaginationResponseWrapper(
        data: apiDataHandler(response),
        count: response['count'],
      );
    } on BaseAppException catch (e) {
      debugPrint("error in transferExceededClients: $e");
      throw e.message;
    }
  }
}
