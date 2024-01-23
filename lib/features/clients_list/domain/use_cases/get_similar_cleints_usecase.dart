import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/data/models/similarClient.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/recommended_client.dart';

@injectable
class GetSimilarClientsUsecase extends
UseCase<Result<ResponseWrapper<List<SimilarClient>>>, GetSimilarClientsListParams> {
  GetSimilarClientsUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<SimilarClient>>>>
  call(GetSimilarClientsListParams params) {
    // TODO: implement call
    return repository.getSimilarClients(params.toMap());

  }

}

class GetSimilarClientsListParams {
  final String name_client;
  final String name_enterprise;
  final String phone;

  GetSimilarClientsListParams({
    required this.name_client,
    required this.name_enterprise,
    required this.phone,
  });

  Map<String, dynamic> toMap() => {
    'name_client': this.name_client,
    'name_enterprise': this.name_enterprise.toString(),
    'phone': this.phone.toString(),
  };
}