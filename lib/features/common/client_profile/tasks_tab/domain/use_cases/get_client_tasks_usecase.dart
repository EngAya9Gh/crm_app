import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/client_tasks_tab_repo.dart';

@lazySingleton
class GetClientTasksUsecase extends BaseUsecase<Result<ResponseWrapper<List<TaskModel>>>,GetClientTasksParams> {
  GetClientTasksUsecase(this._repository);

  final ClientTasksTabRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<TaskModel>>>> call(GetClientTasksParams params) async {
    return await _repository.getClientTasks(params);
  }
}


class GetClientTasksParams{
  final String idClient;

  const GetClientTasksParams({
    required this.idClient,
  });
}