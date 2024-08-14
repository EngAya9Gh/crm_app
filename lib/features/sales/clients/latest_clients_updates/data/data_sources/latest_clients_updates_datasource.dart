import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_latest_clients_comments_usecase.dart';

abstract class LatestClientsUpdatesDatasource {
  Future<PaginationResponseWrapper> getLatestClients(
    GetLatestClientsParams params,
  );
}

@LazySingleton(as: LatestClientsUpdatesDatasource)
class LatestClientsUpdatesDatasourceImpl
    implements LatestClientsUpdatesDatasource {
  final ApiServices _apiServices;

  LatestClientsUpdatesDatasourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getLatestClients(
    GetLatestClientsParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.client.getClientLastComment,
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper(
        data: apiDataHandler(response),
        count: response['count'],
      );
    } on BaseAppException catch (e) {
      debugPrint('error in getLatestClients $e');
      throw e.message;
    }
  }
}
