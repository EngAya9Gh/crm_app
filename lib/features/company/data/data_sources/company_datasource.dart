import 'package:crm_smart/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../models/company_com_model.dart';


@injectable
class CommentCompanyDatasource {
  final ClientApi _clientApi;

  CommentCompanyDatasource(this._clientApi);

  Future<ResponseWrapper<List<CompanyCommentModel>>> getCommment(String fk) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.company.getComment+fk,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';

      return ResponseWrapper<List<CompanyCommentModel>>(
        data: List.from(
            (response.data['data'] as List<dynamic>)
                .map((e) => CompanyCommentModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<CompanyCommentModel>> addComment({
    required Map<String, dynamic> body,required String fk
  }) async {
    final dio = GetIt.I<Dio>();
    dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.company.addComment+fk,
          data: body,

          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';

      return ResponseWrapper<CompanyCommentModel>.fromJson(
        response.data,
            (json) => CompanyCommentModel.fromJson(response.data['data']),
      );
    }

    return throwAppException(fun);
  }


}
