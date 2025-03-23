import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/utils/end_points.dart';
import '../models/update_config.dart';

@injectable
class AppDatasource {
  AppDatasource(this.api);

  final ApiServices api;

  Future<ResponseWrapper<List<UpdateConfig>>> getVersion() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      // final response = await api.get(endPoint: EndPoints.app.getVersion);

      // return ResponseWrapper<List<UpdateConfig>>.fromJson(
          // response,
          // (json) => List.from((json as List<dynamic>)
              // .map((e) => UpdateConfig.fromJson(e as Map<String, dynamic>))));
      //TODO: uncommit this edit comminted code
      return ResponseWrapper<List<UpdateConfig>>(data: [], message: [UpdateConfig()]);
              
    }

    return throwAppException(fun);
  }
}
