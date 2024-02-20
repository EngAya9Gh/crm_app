import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/profile_invoice_model.dart';
import '../../../../core/use_case/use_case.dart';

@injectable
class GetAgentInvoiceListUsecase extends UseCase<
    Either<String, List<ProfileInvoiceModel>>, GetAgentInvoiceListParams> {
  GetAgentInvoiceListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<ProfileInvoiceModel>>> call(
      GetAgentInvoiceListParams params) {
    return repository.getAgentInvoicesList(agentId: params.agentId!);
  }
}

class GetAgentInvoiceListParams {
  final String? agentId;

  GetAgentInvoiceListParams({this.agentId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_agent': agentId};
}
