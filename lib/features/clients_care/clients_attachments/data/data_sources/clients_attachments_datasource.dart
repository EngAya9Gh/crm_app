import 'package:crm_smart/features/clients_care/clients_attachments/data/models/attachment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';
import '../models/subscribed_clients_model.dart';

@injectable
class ClientAttachmentsDatasource {
  final ApiServices api;

  ClientAttachmentsDatasource(this.api);

  Future<Either<String, List<AttachmentModel>>> getAttachments(GetAttachmentsParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.client.getClientFiles,
        queryParameters: params.toMap(),
      );

      return Right((response['message'] as List< dynamic>).map((e) => AttachmentModel.fromJson(e)).toList());
    } on BaseAppException catch (e) {
      debugPrint("error in get Client Attachment in datasource => $e");
      throw e.message;
    }
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
