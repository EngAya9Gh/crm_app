import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../repositories/task_repository.dart';

@injectable
class GetTaskByIdUsecase extends BaseUsecase<Result<ResponseWrapper<TaskModel>>,GetTaskByIdParams> {
  GetTaskByIdUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<TaskModel>>> call(GetTaskByIdParams params) {
    return repository.getTaskById(params);
  }
}

class GetTaskByIdParams {
  final int idTask;

  GetTaskByIdParams({required this.idTask});
}
