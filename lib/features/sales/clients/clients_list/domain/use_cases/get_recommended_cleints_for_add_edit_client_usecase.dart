import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../finance/clients_attachments/data/models/subscribed_clients_model.dart';
import '../../data/models/recommended_client.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetRecommendedClientsFilterClientUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<SubscribedClientsModel>>>> {
  GetRecommendedClientsFilterClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<SubscribedClientsModel>>>> call() {
    return repository.getRecommendedClientsFilterClient();
  }
}
