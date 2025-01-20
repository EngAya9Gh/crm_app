
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';
import '../models/attachment_model.dart';
import '../models/subscribed_clients_model.dart';

@injectable
class ClientAttachmentsDatasource {
  final ApiServices api;

  ClientAttachmentsDatasource(this.api);

  Future<ResponseWrapper< List<AttachmentModel>>> getAttachments(GetAttachmentsParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.client.getClientFiles,
        queryParameters: params.toMap(),
      );

      return ResponseWrapper<List<AttachmentModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return AttachmentModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }
  Future<Either<String, List<SubscribedClientsModel>>> getAllClient() async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.client.subscribedClients,
      );

      return Right((response['message'] as List< dynamic>).map((e) => SubscribedClientsModel.fromJson(e)).toList());
    } on BaseAppException catch (e) {
      debugPrint("error in get Client Attachment in datasource => $e");
      throw e.message;
    }
  }
}
