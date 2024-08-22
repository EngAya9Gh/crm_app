import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetCancelReasonsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetCancelReasonsParams> {
  GetCancelReasonsUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetCancelReasonsParams params,
  ) async {
    return await _repository.getCancelReasons(params);
  }
}

class GetCancelReasonsParams {
  const GetCancelReasonsParams();
}
