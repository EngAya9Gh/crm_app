import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/manage_withdrawn_invoices_repo.dart';

@lazySingleton
class GetManageWithdrawnInvoicesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>,
    GetManageWithdrawnInvoicesParams> {
  GetManageWithdrawnInvoicesUsecase(this._repository);

  final ManageWithdrawnInvoicesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetManageWithdrawnInvoicesParams params,
  ) async {
    return await _repository.getManageWithdrawnInvoices(params);
  }
}

class GetManageWithdrawnInvoicesParams {
  final int skip;
  final int? limit;
  final String? searchQuery;
  final WithdrawalInvoiceStatusEnum? status;

  const GetManageWithdrawnInvoicesParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.searchQuery,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
      "status": status?.toParam,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
