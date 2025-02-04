import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../task_management/data/models/task_model.dart';
import '../../domain/repositories/client_tasks_tab_repo.dart';
import '../../domain/use_cases/get_client_tasks_usecase.dart';
import '../data_sources/client_tasks_tab_data_source.dart';

@LazySingleton(as: ClientTasksTabRepo)
class ClientTasksTabRepoImpl implements ClientTasksTabRepo {
  final ClientTasksTabDataSource dataSource;

  ClientTasksTabRepoImpl(this.dataSource);

  @override
  Future<Result<ResponseWrapper<List<TaskModel>>>> getClientTasks(GetClientTasksParams params) async {
    return toApiResult(()=>dataSource.getClientTasks(params));
  }
}
