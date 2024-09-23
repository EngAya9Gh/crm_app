import 'package:injectable/injectable.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../repositories/clients_list_repository.dart';

@lazySingleton
class FetchPaginatedClientsUsecase {
  final ClientsListRepository _repository;

  FetchPaginatedClientsUsecase(this._repository);

  Future<ResponseWrapper<List<ClientModel>>> call(FetchPaginatedClientsParams params) {
    return _repository.fetchPaginatedClients(params);
  }
}

class FetchPaginatedClientsParams {
  final int page;
  final String fkCountry;
  // Add any other necessary parameters

  FetchPaginatedClientsParams({
    required this.page,
    required this.fkCountry,
  });
}