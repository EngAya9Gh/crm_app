import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../repositories/manage_withdrawals_repository.dart';

@lazySingleton
class GetFilteredWithdrawalsInvoicesUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<InvoiceModel>>>,
    GetFilteredWithdrawalsInvoicesParams> {
  GetFilteredWithdrawalsInvoicesUsecase(this._repository);

  final ManageWithdrawalsRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> call(
    GetFilteredWithdrawalsInvoicesParams params,
  ) {
    return _repository.getFilteredWithdrawalsInvoice(params);
  }
}

class GetFilteredWithdrawalsInvoicesParams {
  WithdrawalInvoiceStatusEnum status;

  GetFilteredWithdrawalsInvoicesParams({
    required this.status,
  });
}
