import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/invoice_withdrawal_series_model.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetWithdrawalInvoiceDetailsUsecase extends UseCase<
    Result<ResponseWrapper<List<InvoiceWithdrawalSeries>>>,
    GetWithdrawalInvoiceDetailsParams> {
  GetWithdrawalInvoiceDetailsUsecase(this._repository);

  final ManageWithdrawalsRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<InvoiceWithdrawalSeries>>>> call(
      GetWithdrawalInvoiceDetailsParams params) {
    return _repository.getWithdrawalInvoiceDetails(params.toMap);
  }
}

class GetWithdrawalInvoiceDetailsParams {
  GetWithdrawalInvoiceDetailsParams(this.fkInvoice);

  final String fkInvoice;

  Map<String, dynamic> get toMap => {'fk_invoice': fkInvoice};
}
