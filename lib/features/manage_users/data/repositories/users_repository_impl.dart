import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/manage_users/data/data_sources/users_datasource.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl(this.datasource);

  final UsersDatasource datasource;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> getUsers() {
    return toApiResult(() => datasource.getAllUsers());
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
