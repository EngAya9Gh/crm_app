import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentInvoiceListUsecase extends BaseUsecase<
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
}
