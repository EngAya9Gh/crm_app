import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/users_repository.dart';

@injectable
class GetUsersUsecase
    extends UseCase<Result<ResponseWrapper<List<UserModel>>>, GetUsersParams> {
  GetUsersUsecase(this.repository);

  final UsersRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> call(GetUsersParams params) {
    return repository.getUsers();
  }
}

class GetUsersParams {}
