import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../data/models/recommended_client.dart';
import '../repositories/clients_list_repository.dart';

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
