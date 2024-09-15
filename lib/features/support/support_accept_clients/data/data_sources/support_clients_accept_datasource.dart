import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_support_clients_accept_use_case.dart';

/// SupportClientsAcceptDatasource
/// abstract class SupportClientsAcceptDatasource
/// getClientsAccept
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

  /// Get clients accept
  /// [params] GetSupportClientsAcceptParams
  /// return PaginationResponseWrapper
  /// throws BaseAppException
  @override
  Future<PaginationResponseWrapper> getClientsAccept(
      GetSupportClientsAcceptParams params) async {
    try {
      /// change base url to laravel
      /// [urlLaravel] EndPoints.baseUrls.urlLaravel
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      /// get clients accept
      /// [endPoint] support/getSupportClientsAccept
      final response = await _api.get(
        endPoint: EndPoints.support.getSupportClientsAccept,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getSupportClientsAccept in datasource => $e");
      throw e.message;
    }
  }
}
