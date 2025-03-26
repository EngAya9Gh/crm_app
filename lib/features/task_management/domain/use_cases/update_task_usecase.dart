import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_task_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../repositories/task_repository.dart';

@injectable
class UpdateTaskUsecase extends BaseUsecase<Result<ResponseWrapper<TaskModel>>, AddOrUpdateTaskParams> {
  UpdateTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<TaskModel>>> call(AddOrUpdateTaskParams params) {
    return repository.updateTask(params);
  }
}
