import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_important_links_usecase.dart';
import '../models/important_link_model.dart';

@injectable
class ImportantLinksDatasource {
  final ApiServices api;

  ImportantLinksDatasource(this.api);

  Future<PaginationResponseWrapper> getImportantLinks(
    GetImportantLinksParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.link.getLink,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getImportantLinks in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<ResponseWrapper<ImportantLinkModel>> addLink(
      {required Map<String, dynamic> body}) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response =
          await api.post(endPoint: EndPoints.link.addLink, data: body);
      api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<ImportantLinkModel>.fromJson(
        response,
        (json) => ImportantLinkModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ImportantLinkModel>> updateLink({
    required Map<String, dynamic> body,
    required String id,
  }) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response =
          await api.post(endPoint: EndPoints.link.updateLink + id, data: body);
      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<ImportantLinkModel>.fromJson(
        response,
        (json) => ImportantLinkModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }
}
