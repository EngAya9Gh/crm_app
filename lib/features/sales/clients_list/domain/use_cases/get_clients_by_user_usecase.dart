import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/models/client_model.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetClientsListByUserUseCase extends UseCase<
    Result<ResponseWrapper<List<ClientModel>>>, GetClientsListByUserParams> {
  GetClientsListByUserUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> call(
      GetClientsListByUserParams params) {
    return repository.getClientsByUser(params.toMap());
  }
}

class GetClientsListByUserParams {
  final String user;

  GetClientsListByUserParams({required this.user});

  Map<String, dynamic> toMap() => {'fk_user': this.user};
}
