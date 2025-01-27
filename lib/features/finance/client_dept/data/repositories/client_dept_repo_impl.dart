import 'package:crm_smart/features/finance/client_dept/domain/use_cases/report_client_dept_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/client_dept_repo.dart';
import '../data_sources/client_dept_datasource.dart';
import '../models/client_dept.dart';

@Injectable(as: ClientDeptRepository)
class ClientDeptRepoImpl implements ClientDeptRepository {
  final ClientDeptDatasource datasource;

  ClientDeptRepoImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientDeptModel>>>> getClientDept() async {
    return toApiResult(() async => await datasource.getClientDept());
  }

  @override
  Future<Result<bool>> reportClient(ReportClientParams params) async{
    return toApiResult(() async => await datasource.reportClient(params));
  }
}
