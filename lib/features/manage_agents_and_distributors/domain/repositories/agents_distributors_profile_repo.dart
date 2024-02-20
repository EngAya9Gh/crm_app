import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/models/profile_invoice_model.dart';
import '../../../clients_list/data/models/clients_list_response.dart';

abstract class AgentsDistributorsProfileRepo {
  Future<Either<String, List<ClientModel>>> getAgentsClientsList({
    required String agentId,
  });

  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoicesList({
    required String agentId,
  });

  Future<Either<String, List<ProfileCommentModel>>> getParticipateCommentsList({
    required String agentId,
  });
// Future<Result<ResponseWrapper<ParticipateCommentModel>>> addCompanyComment(
//     Map<String, dynamic> body);
}
