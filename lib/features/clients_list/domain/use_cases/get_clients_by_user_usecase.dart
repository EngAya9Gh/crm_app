import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class GetClientsListByUserUseCase
    extends UseCase<Result<ResponseWrapper<List<ClientsListResponse>>>, GetClientsListByUserParams> {
  GetClientsListByUserUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientsListResponse>>>> call(GetClientsListByUserParams params) {
    return repository.getClientsByUser(params.toMap());
  }
}

class GetClientsListByUserParams {
  final String user;

  GetClientsListByUserParams({required this.user});

  Map<String, dynamic> toMap() => {'fk_user': this.user};
}
