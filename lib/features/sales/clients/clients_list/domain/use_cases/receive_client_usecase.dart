import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ReceiveClientUserUsecase
    extends BaseUsecase<Either<String, ClientModel>, ReceiveClientParams> {
  ReceiveClientUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, ClientModel>> call(ReceiveClientParams params) {
    return repository.receiveClient(params);
  }
}

class ReceiveClientParams {
  final String idClient;

  ReceiveClientParams({
    required this.idClient,
  });
}
