import 'package:injectable/injectable.dart';

import '../../data/repositories/client_repository.dart';

@injectable
class LinkSelectedClientsUseCase {

  final ClientRepository _repository;

  LinkSelectedClientsUseCase(this._repository);

  Future<bool> call(String clientId, List<String> selectedIds) async {
    return await _repository.linkClientTo(clientId, selectedIds);
  }
}