import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/not_using_system_repo.dart';

@lazySingleton
class GetNotUsingSystemUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetNotUsingSystemParams> {
  GetNotUsingSystemUsecase(this._repository);

  final NotUsingSystemRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetNotUsingSystemParams params,
  ) async {
    return await _repository.getNotUsingSystem(params);
  }
}

class GetNotUsingSystemParams {
  final int skip;
  final int limit;
  final String? filter;
  final String? fkUser;
  final String? fkRegion;

  const GetNotUsingSystemParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.fkUser,
    this.fkRegion,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': filter,
      'fk_user': fkUser,
      'fk_regoin': fkRegion,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
