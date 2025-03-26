import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../repositories/task_repository.dart';

@injectable
class ChangeTaskAssignUsecase extends BaseUsecase<Result<ResponseWrapper<TaskModel>>, ChangeTaskAssignParams> {
  ChangeTaskAssignUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<TaskModel>>> call(ChangeTaskAssignParams params) {
    return repository.changeTaskAssign(params);
  }
}

class ChangeTaskAssignParams {
  
  final int taskId;
  final String assignTo;
  final String assignToId;

  ChangeTaskAssignParams({required this.taskId, required this.assignTo, required this.assignToId});

  Map<String, dynamic> get toMap {
    return {
      'assign_to': this.assignTo,
      'assign_to_id': this.assignToId,
    };
  }
}
