import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class TransferClientUserUsecase
    extends BaseUsecase<Either<String, ClientModel>, TransferClientParams> {
  TransferClientUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, ClientModel>> call(TransferClientParams params) {
    return repository.transferClient(params);
  }
}

class TransferClientParams {
  final idClient;
  final String fkUserTo;

  TransferClientParams({
    required this.idClient,
    required this.fkUserTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idClient,
      'fk_user': fkUserTo,
    };
  }
}
