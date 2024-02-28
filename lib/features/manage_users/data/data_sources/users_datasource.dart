import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';

@injectable
class UsersDatasource {
  final ApiServices api;

  UsersDatasource(this.api);

  Future<ResponseWrapper<List<UserModel>>> getAllUsers() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(endPoint: EndPoints.users.allUsers);

      return ResponseWrapper<List<UserModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return UserModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<UserModel>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response =
          await api.post(endPoint: EndPoints.users.addUser, data: body);

      return ResponseWrapper<UserModel>.fromJson(
        response,
        (json) => UserModel.fromJson(json[0]),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<UserModel>> editUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.post(
        endPoint: EndPoints.users.updateUser,
        data: body,
        queryParameters: param,
      );
      return ResponseWrapper<UserModel>.fromJson(
        response,
        (json) => UserModel.fromJson(json[0]),
      );
    }

    return throwAppException(fun);
  }
}
