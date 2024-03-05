import 'package:injectable/injectable.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../models/company_com_model.dart';

@injectable
class CommentCompanyDatasource {
  final ApiServices api;

  CommentCompanyDatasource(this.api);

  Future<ResponseWrapper<List<CompanyCommentModel>>> getCommment(
      String fk) async {
    fun() async {
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response =
          await api.get(endPoint: EndPoints.company.getComment + fk);
      api.changeBaseUrl(EndPoints.phpUrl);

      return ResponseWrapper<List<CompanyCommentModel>>(
        data: List.from((response['data'] as List<dynamic>).map(
            (e) => CompanyCommentModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<CompanyCommentModel>> addComment(
      {required Map<String, dynamic> body, required String fk}) async {
    fun() async {
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.post(
        endPoint: EndPoints.company.addComment + fk,
        data: body,
      );

      api.changeBaseUrl(EndPoints.phpUrl);
      return ResponseWrapper<CompanyCommentModel>.fromJson(
        response,
        (json) => CompanyCommentModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }
}
