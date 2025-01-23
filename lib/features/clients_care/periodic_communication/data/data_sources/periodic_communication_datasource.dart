import 'package:crm_smart/core/common/enums/periodic_communication_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_periodic_communication_use_case.dart';

abstract class PeriodicCommunicationDatasource {
  Future<PaginationResponseWrapper> getPeriodicCommunication(
    GetPeriodicCommunicationParams params,
  );
}

@LazySingleton(as: PeriodicCommunicationDatasource)
class PeriodicCommunicationDatasourceImpl implements PeriodicCommunicationDatasource {
  final ApiServices _api;

  const PeriodicCommunicationDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getPeriodicCommunication(
    GetPeriodicCommunicationParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: params.periodicCommunicationType.url,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getPeriodicCommunication in datasource => $e");
      throw e.message;
    }
  }
}
