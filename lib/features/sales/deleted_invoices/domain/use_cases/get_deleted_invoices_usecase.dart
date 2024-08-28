import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/deleted_invoices_repo.dart';

@lazySingleton
class GetDeletedInvoicesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetDeletedParams> {
  GetDeletedInvoicesUsecase(this._repository);

  final DeletedInvoicesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetDeletedParams params,
  ) async {
    return await _repository.getDeletedInvoices(params);
  }
}

class GetDeletedParams {
  final int skip;
  final int? limit;
  final String? searchQuery;

  const GetDeletedParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.searchQuery,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
