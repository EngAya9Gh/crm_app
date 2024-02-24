import 'package:crm_smart/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';

@injectable
class UsersDatasource {
  final ClientApi _clientApi;

  UsersDatasource(this._clientApi);

  Future<ResponseWrapper<List<UserModel>>> getAllUsers() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.users.allUsers,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<UserModel>>.fromJson(
        response.data,
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
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.users.addUser,
          data: body,
          queryParameters: param,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<UserModel>.fromJson(
        response.data,
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
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.users.updateUser,
          data: body,
          queryParameters: param,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json[0]),
      );
    }

    return throwAppException(fun);
  }
}
