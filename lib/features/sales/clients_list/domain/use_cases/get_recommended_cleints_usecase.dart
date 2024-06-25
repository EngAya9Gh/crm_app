import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/recommended_client.dart';

@injectable
class GetRecommendedClientsUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<RecommendedClient>>>> {
  GetRecommendedClientsUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> call() {
    return repository.getRecommendedClients();
  }
}
