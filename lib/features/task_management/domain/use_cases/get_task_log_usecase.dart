import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/task_management/data/models/task_log_model.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/get_task_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/usecases/base_usecase.dart';
import '../repositories/task_repository.dart';

@injectable
class GetTaskLogUsecase extends BaseUsecase<Result<ResponseWrapper<List<TaskLogModel>>>,GetTaskByIdParams> {
  GetTaskLogUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<TaskLogModel>>>> call(GetTaskByIdParams params) {
    return repository.getTaskLog(params);
  }
}
