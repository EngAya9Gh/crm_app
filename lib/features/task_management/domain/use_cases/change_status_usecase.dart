import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../repositories/task_repository.dart';

@injectable
class ChangeStatusTaskUsecase
    extends BaseUsecase<Result<ResponseWrapper<void>>, ChangeStatusTaskParams> {
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
        'status_id': this.taskStatusId,
        'id_user': userId,
      };
}
