import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetUsersUsecase
    extends BaseUsecase<Either<String, List<UserEntity>>, GetUsersParams> {
  final UsersRepository repository;

  GetUsersUsecase(this.repository);

  @override
  Future<Either<String, List<UserEntity>>> call(
    GetUsersParams params,
  ) {
    return repository.getUsers(params);
  }
}

class GetUsersParams {
  final UserTypeEnum user;

  const GetUsersParams({
    required this.user,
  });
}
