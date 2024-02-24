import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/app/data/models/update_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';

@injectable
class AppDatasource {
  AppDatasource(this._clientApi);

  final ClientApi _clientApi;

  Future<ResponseWrapper<List<UpdateConfig>>> getVersion() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.app.getVersion,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<UpdateConfig>>.fromJson(
          response.data,
          (json) => List.from((json as List<dynamic>)
              .map((e) => UpdateConfig.fromJson(e as Map<String, dynamic>))));
    }

    return throwAppException(fun);
  }
}
