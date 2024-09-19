import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../data/repositories/client_list_repository_impl.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class FetchLinkClientsUseCase {
  final ClientsListRepository _repository;

  FetchLinkClientsUseCase(this._repository);

  Future< List<ClientModel>> call(String clientId) async {
    return await  _repository.getLinkClients(clientId);
  }
}

//aya