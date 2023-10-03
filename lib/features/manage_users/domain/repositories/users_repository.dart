import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/model/usermodel.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';

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
