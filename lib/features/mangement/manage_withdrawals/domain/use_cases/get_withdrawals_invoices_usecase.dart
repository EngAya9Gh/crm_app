import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
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
