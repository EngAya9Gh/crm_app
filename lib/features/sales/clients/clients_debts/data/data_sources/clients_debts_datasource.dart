import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_debts_usecase.dart';

abstract class ClientsDebtsDatasource {
  Future<PaginationResponseWrapper> getClientsDebts(
    GetClientsDebtsParams params,
  );
}

@LazySingleton(as: ClientsDebtsDatasource)
class ClientsDebtsDatasourceImpl implements ClientsDebtsDatasource {
  final ApiServices _api;

  const ClientsDebtsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsDebts(
      GetClientsDebtsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
          endPoint: EndPoints.client.getClientsDebts + "?fk_country=1",
          // queryParameters: params.toParams(),
          data: {"type": "all"});

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsDebts in datasource => $e");
      throw e.message;
    }
  }
}
