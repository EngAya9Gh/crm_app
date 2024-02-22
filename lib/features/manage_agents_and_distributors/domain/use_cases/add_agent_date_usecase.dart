import 'package:dartz/dartz.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../../model/invoiceModel.dart';
import '../repositories/agents_distributors_profile_repo.dart';

class AddAgentDateUseCase
    extends UseCase<Either<String, void>, AddAgentDateUseCaseParams> {
  final AgentsDistributorsProfileRepo agentsDistributorsProfileRepo;

  AddAgentDateUseCase(this.agentsDistributorsProfileRepo);

  @override
  Future<Either<String, void>> call(AddAgentDateUseCaseParams params) async {
    return await agentsDistributorsProfileRepo.addAgentDate(
      agentDateModel: params.agentModel,
    );
  }
}

class AddAgentDateUseCaseParams {
  final DateInstallationClient agentModel;

  AddAgentDateUseCaseParams({
    required this.agentModel,
  });
}
