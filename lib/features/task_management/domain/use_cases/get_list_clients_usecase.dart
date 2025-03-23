
import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../repositories/task_repository.dart';

@injectable
class GetListClientsUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<ClientModel>>>> {
  GetListClientsUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> call() {
    return repository.getListClients();
  }
}
