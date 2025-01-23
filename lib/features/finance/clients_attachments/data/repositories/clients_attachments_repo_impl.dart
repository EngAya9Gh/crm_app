
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../domain/repositories/clients_attachments_repo.dart';
import '../../domain/use_cases/get_attachments_usecase.dart';
import '../data_sources/clients_attachments_datasource.dart';
import '../models/attachment_model.dart';
import '../models/subscribed_clients_model.dart';


@Injectable(as: ClientsAttachmentsRepository)
class ClientsAttachmentsRepoImpl implements ClientsAttachmentsRepository {
  final ClientAttachmentsDatasource datasource;

  ClientsAttachmentsRepoImpl(this.datasource);

  @override
  Future<ResponseWrapper< List<AttachmentModel>>> getAttachments(GetAttachmentsParams params) async{
      final response = await datasource.getAttachments(params);
      return response;
  }

  @override
  Future<Either<String, List<SubscribedClientsModel>>> getAllClient() async{
    try {
      final response = await datasource.getAllClient();
      return response;
    } catch (e) {
      debugPrint("error in transferExceededClients: $e");
      return Left(e.toString());
    }

  }

}
