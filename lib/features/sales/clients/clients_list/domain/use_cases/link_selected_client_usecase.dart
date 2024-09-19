import 'package:injectable/injectable.dart';

import '../../data/repositories/client_list_repository_impl.dart';


@injectable
class LinkSelectedClientsUseCase {

  final ClientsListRepositoryImpl _repository;

  LinkSelectedClientsUseCase(this._repository);

  Future<bool> call(String clientId, List<String> selectedIds) async {
    return await _repository.linkClientTo(clientId, selectedIds);
  }
}