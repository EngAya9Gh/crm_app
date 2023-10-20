import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetWithdrawalsInvoicesUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<InvoiceModel>>>> {
  GetWithdrawalsInvoicesUsecase(this._repository);

  final ManageWithdrawalsRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> call() {
    return _repository.getWithdrawalsInvoice();
  }
}
