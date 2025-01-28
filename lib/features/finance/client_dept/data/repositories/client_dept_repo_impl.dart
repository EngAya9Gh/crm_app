import 'package:crm_smart/features/finance/client_dept/domain/use_cases/report_client_dept_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../domain/repositories/client_dept_repo.dart';
import '../data_sources/client_dept_datasource.dart';
import '../models/client_dept.dart';

@Injectable(as: ClientDeptRepository)
class ClientDeptRepoImpl implements ClientDeptRepository {
  final ClientDeptDatasource datasource;

  ClientDeptRepoImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientDeptModel>>>> getClientDept(GetInvoicesByPrivilegesParams params) async {
    return toApiResult(() async => await datasource.getClientDept(params));
  }

  @override
  Future<Result<bool>> reportClient(ReportClientParams params) async{
    return toApiResult(() async => await datasource.reportClient(params));
  }
}
