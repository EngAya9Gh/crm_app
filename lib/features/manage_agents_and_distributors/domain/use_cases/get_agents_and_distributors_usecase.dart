import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../../model/agent_distributor_model.dart';
import '../repositories/agents_distributors_repo.dart';

@lazySingleton
class GetAgentsAndDistributorsUseCase
    extends UseCase<Either<String, List<AgentDistributorModel>>, NoParams> {
  final AgentsDistributorsRepo repository;

  GetAgentsAndDistributorsUseCase(this.repository);

  @override
  Future<Either<String, List<AgentDistributorModel>>> call(NoParams params) {
    return repository.getAgentsAndDistributors();
  }
}
