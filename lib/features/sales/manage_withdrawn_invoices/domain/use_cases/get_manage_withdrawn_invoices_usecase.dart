import 'package:crm_smart/core/common/models/location/branch_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/manage_withdrawn_invoices_repo.dart';
import 'package:collection/collection.dart';

@lazySingleton
class GetManageWithdrawnInvoicesUsecase extends BaseUsecase<Either<String, PaginationResponseWrapper>, GetManageWithdrawnInvoicesParams> {
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
  final List<BranchModel>? branch;
  final String? fkIdUser;
  final String? userWithdraw;
  final bool? sortAsc;
  final String? from;
  final String? to;
  final String? dateWithdrawnFrom;
  final String? dateWithdrawnTo;

  const GetManageWithdrawnInvoicesParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.searchQuery,
    this.status,
    this.branch,
    this.fkIdUser,
    this.userWithdraw,
    this.sortAsc,
    this.from,
    this.to,
    this.dateWithdrawnFrom,
    this.dateWithdrawnTo,
  });

  Map<String, dynamic> toMap() {
    Map branchIds = {};
    branch?.forEachIndexed((i, e) => branchIds.addAll({'branch_ids[$i]': e.branchId}));
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
      "status": status?.toParam,
      ...branchIds,
      // "fk_regoin_invoice": branch?.branchId,
      "fk_idUser": fkIdUser,
      "user_withdraw": userWithdraw,
      if (sortAsc != null) "order_dir": sortAsc! ? 'asc' : 'desc',
      "from": from,
      "to": to,
      "withdraw_from": dateWithdrawnFrom,
      "withdraw_to": dateWithdrawnTo,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
