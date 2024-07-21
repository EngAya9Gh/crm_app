import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/usermodel.dart';
import '../../domain/repositories/users_repository.dart';
import '../../domain/use_cases/get_users_usecase.dart';
import '../data_sources/users_datasource.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl(this.datasource);

  final UsersDatasource datasource;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> getUsers(
    GetUsersParams params,
  ) {
    return toApiResult(() => datasource.getAllUsers(params));
  }

  @override
  Future<Result<ResponseWrapper<UserModel>>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) {
    return toApiResult(() => datasource.addUser(body: body, param: param));
  }

  @override
  Future<Result<ResponseWrapper<UserModel>>> updateUser(
      {required Map<String, dynamic> body,
      required Map<String, dynamic> param}) {
    return toApiResult(() => datasource.editUser(body: body, param: param));
  }
}
