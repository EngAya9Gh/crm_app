import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetClientsListByUserUseCase extends BaseUsecase<
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
