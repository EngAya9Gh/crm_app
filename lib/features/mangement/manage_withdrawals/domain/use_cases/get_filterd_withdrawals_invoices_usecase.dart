import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/invoice_status_enum.dart';
import '../repositories/manage_withdrawals_repository.dart';

@lazySingleton
class GetFilteredWithdrawalsInvoicesUsecase extends UseCase<
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
  InvoiceStatusEnum status;

  GetFilteredWithdrawalsInvoicesParams({
    required this.status,
  });
}
