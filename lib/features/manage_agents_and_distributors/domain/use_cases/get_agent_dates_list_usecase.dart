import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/invoiceModel.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@injectable
class GetAgentDatesListUsecase extends UseCase<
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
