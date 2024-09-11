import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/users_repository.dart';

@injectable
class GetUserByIdUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetUserByIdParams> {
  GetUserByIdUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetUserByIdParams params,
  ) {
    return _repository.getUserById(params);
  }
}

class GetUserByIdParams {
  final String id;

  const GetUserByIdParams({
    required this.id,
  });

  toParams() {
    return {'id': id};
  }
}
