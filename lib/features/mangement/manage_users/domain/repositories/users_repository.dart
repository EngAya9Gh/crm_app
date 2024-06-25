import '../../../../../core/services/api/result.dart';
import '../../../../../model/usermodel.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';

abstract class UsersRepository {
  Future<Result<ResponseWrapper<List<UserModel>>>> getUsers();
  Future<Result<ResponseWrapper<UserModel>>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });
  Future<Result<ResponseWrapper<UserModel>>> updateUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });
}
