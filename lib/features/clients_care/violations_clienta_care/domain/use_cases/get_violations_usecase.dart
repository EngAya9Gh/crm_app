import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/violations_repository.dart';


@lazySingleton
class GetViolationsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetViolationsParams> {
  GetViolationsUsecase(this._repository);

  final ViolationsRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
      GetViolationsParams params,
      ) async {
    return await _repository.getViolations(params);
  }
}

class GetViolationsParams {
  final int skip;
  final int limit;
  final String? filter;
  final String? managementId;
  final String? userId;
  final String? violationTypeId;

  const GetViolationsParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.managementId,
    this.userId,
    this.violationTypeId,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      'user_id': userId,
      'violation_type_id': violationTypeId,
      'management_id': managementId,
    }..removeWhere((key, value) => value == null || value == '');
  }
}