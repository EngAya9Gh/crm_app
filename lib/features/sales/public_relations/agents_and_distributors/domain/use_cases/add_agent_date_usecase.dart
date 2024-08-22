import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class AddAgentDateUseCase
    extends BaseUsecase<Either<String, void>, AddAgentDateUseCaseParams> {
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
