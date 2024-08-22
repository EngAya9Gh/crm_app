import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentDatesListUsecase extends BaseUsecase<
    Either<String, List<DateInstallationClient>>, GetAgentDatesListParams> {
  GetAgentDatesListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<DateInstallationClient>>> call(
      GetAgentDatesListParams params) {
    return repository.getDateVisitAgent(agentId: params.agentId!);
  }
}

class GetAgentDatesListParams {
  final String? agentId;

  GetAgentDatesListParams({this.agentId});
}
