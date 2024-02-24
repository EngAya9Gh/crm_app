import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeStatusTaskUsecase
    extends UseCase<Result<ResponseWrapper<void>>, ChangeStatusTaskParams> {
  ChangeStatusTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<void>>> call(ChangeStatusTaskParams params) {
    return repository.changeStatusTask(params.taskId, params.toMap);
  }
}

class ChangeStatusTaskParams {
  ChangeStatusTaskParams(this.taskStatusId, this.taskId, this.userId);

  final String taskStatusId;
  final String taskId;
  final String userId;

  Map<String, dynamic> get toMap => {
        'task_statuse_id': this.taskStatusId,
        'id_user': userId,
      };
}
