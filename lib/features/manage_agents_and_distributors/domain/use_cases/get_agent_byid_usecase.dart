import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../model/agent_distributor_model.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentUsecase extends UseCase<
    Either<String, AgentDistributorModel>, GetAgentParams> {
  GetAgentUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, AgentDistributorModel>> call(
      GetAgentParams params) {
    return repository.getAgentByID(agentId: params.agentId!);
  }
}

class GetAgentParams {
  final String? agentId;

  GetAgentParams({this.agentId});
}
