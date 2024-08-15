import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ReceiveClientUserUsecase
    extends UseCase<Either<String, ClientModel>, ReceiveClientParams> {
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
