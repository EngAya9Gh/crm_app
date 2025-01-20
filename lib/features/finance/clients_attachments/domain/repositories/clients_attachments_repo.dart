import 'package:dartz/dartz.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/attachment_model.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../use_cases/get_attachments_usecase.dart';

abstract class ClientsAttachmentsRepository {
  Future<ResponseWrapper< List<AttachmentModel>>> getAttachments(GetAttachmentsParams params);
  Future<Either<String, List<SubscribedClientsModel>>> getAllClient();
}
