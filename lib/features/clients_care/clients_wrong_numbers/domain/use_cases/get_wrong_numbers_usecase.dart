import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/utils/app_constants.dart';
import '../repositories/wrong_numbers_repo.dart';

@lazySingleton
class GetWrongNumbersUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetWrongNumbersParams> {
  GetWrongNumbersUsecase(this._repository);

  final WrongNumbersRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetWrongNumbersParams params,
  ) async {
    return await _repository.getWrongNumbers(params);
  }
}

class GetWrongNumbersParams {
  final int skip;
  final int limit;
  final String? filter;
  final String? fkUser;
  final String? fkRegion;

  const GetWrongNumbersParams({
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
