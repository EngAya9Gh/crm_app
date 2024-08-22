import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/similar_client.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetSimilarClientsUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<SimilarClient>>>, GetSimilarClientsListParams> {
  GetSimilarClientsUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<SimilarClient>>>> call(
      GetSimilarClientsListParams params) {
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
