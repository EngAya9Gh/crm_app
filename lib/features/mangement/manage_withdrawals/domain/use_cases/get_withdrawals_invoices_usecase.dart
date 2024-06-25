import '../../../../../core/services/api/result.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../repositories/manage_withdrawals_repository.dart';

@lazySingleton
class GetWithdrawalsInvoicesUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<InvoiceModel>>>> {
  GetWithdrawalsInvoicesUsecase(this._repository);

  final ManageWithdrawalsRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> call() {
    return _repository.getWithdrawalsInvoice();
  }
}
