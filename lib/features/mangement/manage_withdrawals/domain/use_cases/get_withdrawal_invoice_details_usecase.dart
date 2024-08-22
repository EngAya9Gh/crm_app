import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../repositories/manage_withdrawals_repository.dart';

@injectable
class GetWithdrawalInvoiceDetailsUsecase extends BaseUsecase<
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
