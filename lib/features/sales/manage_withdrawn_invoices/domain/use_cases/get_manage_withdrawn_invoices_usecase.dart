import 'package:crm_smart/core/common/models/location/branch_model.dart';
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
  final BranchModel? branch;
  final String? fkIdUser;
  final String? userWithdraw;

  const GetManageWithdrawnInvoicesParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.searchQuery,
    this.status,
    this.branch,
    this.fkIdUser,
    this.userWithdraw,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
      "status": status?.toParam,
      "fk_regoin_invoice": branch?.branchId,
      "fk_idUser": fkIdUser,
      "user_withdraw": userWithdraw,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
