import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/client_list_repository_impl.dart';
import '../repositories/clients_list_repository.dart';


@injectable
class LinkSelectedClientsUseCase {

  final ClientsListRepository _repository;

  LinkSelectedClientsUseCase(this._repository);

  Future<Either<String, bool>> call(String clientId, List<String> selectedIds) async {
    return await _repository.linkClientTo(clientId, selectedIds);
  }
}