import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../data/models/client_dept.dart';
import '../repositories/client_dept_repo.dart';

@injectable
class GetClientDeptUseCase extends BaseUsecase<Result<ResponseWrapper<List<ClientDeptModel>>>,GetInvoicesByPrivilegesParams> {
  GetClientDeptUseCase(this.repository);

  final ClientDeptRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientDeptModel>>>> call(GetInvoicesByPrivilegesParams params) {
    return repository.getClientDept(params);
  }
}
