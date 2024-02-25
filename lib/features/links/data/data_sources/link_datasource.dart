import 'package:injectable/injectable.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../models/link_model.dart';

@injectable
class LinkDatasource {
  final ApiServices api;

  LinkDatasource(this.api);

  Future<ResponseWrapper<List<LinkImportantModel>>> getLink() async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.get(endPoint: EndPoints.link.getLink);
      api.changeBaseUrl(EndPoints.baseUrl);
      //
      // return ResponseWrapper<List<LinkImportantModel>>.fromJson(
      //   response['data'],
      //       (json) {
      //     return List.from((json as List<dynamic>).map((e) {
      //       return LinkImportantModel.fromJson(e as Map<String, dynamic>);
      //     }));
      //   },
      // );

      return ResponseWrapper<List<LinkImportantModel>>(
        data: List.from((response['data'] as List<dynamic>).map(
            (e) => LinkImportantModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<LinkImportantModel>> addLink(
      {required Map<String, dynamic> body}) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response =
          await api.post(endPoint: EndPoints.link.addLink, data: body);
      api.changeBaseUrl(EndPoints.baseUrl);
      return ResponseWrapper<LinkImportantModel>.fromJson(
        response,
        (json) => LinkImportantModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<LinkImportantModel>> updateLink({
    required Map<String, dynamic> body,
    required String id,
  }) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response =
          await api.post(endPoint: EndPoints.link.updateLink + id, data: body);
      api.changeBaseUrl(EndPoints.baseUrl);

      return ResponseWrapper<LinkImportantModel>.fromJson(
        response,
        (json) => LinkImportantModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }
}
