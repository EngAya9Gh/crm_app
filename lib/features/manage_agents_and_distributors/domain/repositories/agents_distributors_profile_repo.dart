import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/models/profile_invoice_model.dart';
import '../../../clients_list/data/models/clients_list_response.dart';
import '../../data/models/agent_date_model.dart';

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

  Future<Either<String, ProfileCommentModel>> addAgentComment({
    required String agentId,
    required String content,
  });

  Future<Either<String, void>> addAgentDate({
    required AgentDateModel agentDateModel,
  });
}
