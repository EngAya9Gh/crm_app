import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_support_clients_accept_use_case.dart';

abstract class SupportClientsAcceptDatasource {
  Future<PaginationResponseWrapper> getClientsAccept(
    GetSupportClientsAcceptParams params,
  );
}

@LazySingleton(as: SupportClientsAcceptDatasource)
class SupportClientsAcceptDatasourceImpl
    implements SupportClientsAcceptDatasource {
  final ApiServices _api;

  const SupportClientsAcceptDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsAccept(
      GetSupportClientsAcceptParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(
        endPoint: EndPoints.support.getSupportClientsAccept +
            "?fk_country=${params.fkCountry}" +
            params.toUrl(),
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
