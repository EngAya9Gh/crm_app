import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../model/invoiceModel.dart';
import '../../../clients_list/data/models/clients_list_response.dart';

abstract class AgentsDistributorsProfileRepo {
  Future<Either<String, List<ClientModel>>> getAgentsClientsList({
    required String agentId,
  });
  Future<Either<String, AgentDistributorModel>> getAgentByID({
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
  Future<Either<String, AgentDistributorModel>> doneTraining({
    required String agentId,
    required String fkuser,
  });

  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  });

  Future<Either<String, void>> addAgentDate({
    required DateInstallationClient agentDateModel,
  });
}
