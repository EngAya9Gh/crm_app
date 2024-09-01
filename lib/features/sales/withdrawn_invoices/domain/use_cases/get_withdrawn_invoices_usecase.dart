import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/withdrawn_invoices_repo.dart';

@lazySingleton
class GetWithdrawnInvoicesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetWithdrawnInvoicesParams> {
  GetWithdrawnInvoicesUsecase(this._repository);

  final WithdrawnInvoicesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetWithdrawnInvoicesParams params,
  ) async {
    return await _repository.getWithdrawnInvoices(params);
  }
}

class GetWithdrawnInvoicesParams {
  final int skip;
  final int? limit;
  final String? searchQuery;
  final BranchModel? branch;
  final UserEntity? user;
  final String? from;
  final String? to;

  const GetWithdrawnInvoicesParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.searchQuery,
    this.branch,
    this.user,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
      'fk_region': branch?.branchId,
      'user_withdraw': user?.id,
      'from': from,
      'to': to,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
