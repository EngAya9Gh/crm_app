import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/client_dept.dart';
import '../use_cases/report_client_dept_usecase.dart';

abstract class ClientDeptRepository {
  Future<Result<ResponseWrapper<List<ClientDeptModel>>>> getClientDept(GetInvoicesByPrivilegesParams params);
  Future<Result<bool>> reportClient(ReportClientParams params);
}
