
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';

@injectable
class AddClientsContactsDatasource {
  final ApiServices api;

  AddClientsContactsDatasource(this.api);

  Future<ResponseWrapper<ClientContactModel>> addClientContact(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.postRequestWithFile(
          endPoint: EndPoints.client.contacts, data: body);


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<ClientContactModel>.fromJson(
        response,
            (json) {
            return ClientContactModel.fromJson(json);
        },
      );

    }

    return throwAppException(fun);
  }

}
