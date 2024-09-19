import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../data/repositories/client_repository.dart';

@injectable
class FetchLinkClientsUseCase {
  final ClientRepository _repository;

  FetchLinkClientsUseCase(this._repository);

  Future<List<ClientModel>> call(String clientId) async {
    return await  _repository.getLinkClients(clientId);
  }
}

//aya