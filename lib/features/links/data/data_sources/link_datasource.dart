import 'package:crm_smart/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../models/link_model.dart';

@injectable
class LinkDatasource {
  final ClientApi _clientApi;

  LinkDatasource(this._clientApi);

  Future<ResponseWrapper<List<LinkImportantModel>>> getLink() async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://new.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.link.getLink,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/aya/api/';
      //
      // return ResponseWrapper<List<LinkImportantModel>>.fromJson(
      //   response.data['data'],
      //       (json) {
      //     return List.from((json as List<dynamic>).map((e) {
      //       return LinkImportantModel.fromJson(e as Map<String, dynamic>);
      //     }));
      //   },
      // );

      return ResponseWrapper<List<LinkImportantModel>>(
        data: List.from(
            (response.data['data'] as List<dynamic>)
                .map((e) => LinkImportantModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<LinkImportantModel>> addLink({
    required Map<String, dynamic> body
  }) async {
    final dio = GetIt.I<Dio>();
    dio.options.baseUrl = 'http://new.smartcrm.ws/api/';

    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.link.addLink,
          data: body,

          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/aya/api/';

      return ResponseWrapper<LinkImportantModel>.fromJson(
        response.data,
            (json) => LinkImportantModel.fromJson(response.data['data']),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<LinkImportantModel>> updateLink({
    required Map<String, dynamic> body,
    required String id,
  }) async {
    final dio = GetIt.I<Dio>();
    dio.options.baseUrl = 'http://new.smartcrm.ws/api/';

    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.link.updateLink+id.toString(),
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/aya/api/';

      return ResponseWrapper<LinkImportantModel>.fromJson(
        response.data,
            (json) => LinkImportantModel.fromJson(response.data['data']),
      );
    }

    return throwAppException(fun);
  }
}
