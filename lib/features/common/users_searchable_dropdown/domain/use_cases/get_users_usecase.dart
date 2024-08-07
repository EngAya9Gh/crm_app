import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../repositories/users_repository.dart';

@lazySingleton
class GetUsersUsecase
    extends UseCase<Either<String, List<UserEntity>>, GetUsersParams> {
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
  final UserType user;

  const GetUsersParams({
    required this.user,
  });
}
