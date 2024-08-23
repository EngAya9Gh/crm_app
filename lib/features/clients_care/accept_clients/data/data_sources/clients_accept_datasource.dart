import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_accept_usecase.dart';

abstract class ClientsAcceptDatasource {
  Future<PaginationResponseWrapper> getClientsAccept(
    GetClientsAcceptParams params,
  );
}

@LazySingleton(as: ClientsAcceptDatasource)
class ClientsAcceptDatasourceImpl implements ClientsAcceptDatasource {
  final ApiServices _api;

  ClientsAcceptDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsAccept(
      GetClientsAcceptParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.care.getClientsAccept,
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper(
        data: apiDataHandler(response),
        count: response['count'],
      );
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsAccept => $e");
      throw e.message;
    }
  }
}
