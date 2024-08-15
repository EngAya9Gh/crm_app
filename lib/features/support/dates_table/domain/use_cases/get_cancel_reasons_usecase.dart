import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetCancelReasonsUsecase extends UseCase<
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
