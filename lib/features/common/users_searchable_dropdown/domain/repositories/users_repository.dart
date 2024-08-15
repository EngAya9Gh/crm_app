import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/user_entity.dart';
import '../use_cases/get_users_usecase.dart';

abstract class UsersRepository {
  Future<Either<String, List<UserEntity>>> getUsers(
    GetUsersParams params,
  );
}
