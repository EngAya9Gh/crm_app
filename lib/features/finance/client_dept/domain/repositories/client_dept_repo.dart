import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/client_dept.dart';
import '../use_cases/report_client_dept_usecase.dart';

abstract class ClientDeptRepository {
  Future<Result<ResponseWrapper<List<ClientDeptModel>>>> getClientDept();
  Future<Result<bool>> reportClient(ReportClientParams params);
}
