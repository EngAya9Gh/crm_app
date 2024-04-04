import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/clients_list_response.dart';

@injectable
class TransferClientUserUsecase
    extends UseCase<Either<String, ClientModel>, TransferClientParams> {
  TransferClientUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, ClientModel>> call(TransferClientParams params) {
    return repository.transferClient(params);
  }
}

class TransferClientParams {
  final idUser;
  final String fkUserTo;

  TransferClientParams({
    required this.idUser,
    required this.fkUserTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'fk_user': fkUserTo,
    };
  }
}
