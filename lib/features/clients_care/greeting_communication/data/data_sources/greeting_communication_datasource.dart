import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_greeting_communication_use_case.dart';

abstract class GreetingCommunicationDatasource {
  Future<PaginationResponseWrapper> getGreetingCommunication(
    GetGreetingCommunicationParams params,
  );
}

@LazySingleton(as: GreetingCommunicationDatasource)
class GreetingCommunicationDatasourceImpl
    implements GreetingCommunicationDatasource {
  final ApiServices _api;

  const GreetingCommunicationDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getGreetingCommunication(
    GetGreetingCommunicationParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      var response = await _api.get(
        endPoint: EndPoints.care.getCommunicationWelcome,
        queryParameters: params.toParams(),
      );
      response = jsonDecode(response);
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getGreetingCommunication in datasource => $e");
      throw e.message;
    }
  }
}
