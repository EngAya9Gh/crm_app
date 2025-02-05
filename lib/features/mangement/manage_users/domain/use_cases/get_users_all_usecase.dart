import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/usermodel.dart';
import '../repositories/users_repository.dart';
import 'get_users_usecase.dart';

@injectable
class GetUsersAllUsecase extends BaseUsecase<Result<ResponseWrapper<List<UserModel>>>, GetUsersParams> {
  GetUsersAllUsecase(this._repository);

  final UsersRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> call(GetUsersParams params) {
    return _repository.getUsersAll(params);
  }
}
