import 'package:crm_smart/features/clients_care/clients_attachments/data/models/attachment_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../use_cases/get_attachments_usecase.dart';

abstract class ClientsAttachmentsRepository {
  Future<Either<String, List<AttachmentModel>>> getAttachments(GetAttachmentsParams params);
  Future<Either<String, List<SubscribedClientsModel>>> getAllClient();
}
