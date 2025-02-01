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
class ReportClientDeptUseCase extends BaseUsecase<Result<bool>, ReportClientParams> {
  ReportClientDeptUseCase(this.repository);

  final ClientDeptRepository repository;

  @override
  Future<Result<bool>> call(ReportClientParams params) {
    return repository.reportClient(params);
  }
}

class ReportClientParams {
  final int clientId;
  final double amount;

  const ReportClientParams({
    required this.clientId,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': this.amount,
    };
  }
}
