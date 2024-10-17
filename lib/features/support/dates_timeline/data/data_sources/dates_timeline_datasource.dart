import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../models/date_timeline_model.dart';

@injectable
abstract interface class DatesTimelineDatasource {
  final ApiServices api;

  DatesTimelineDatasource(this.api);

  Future<ResponseWrapper<List<DateTimelineModel>>> getDateTimelinesByEmployee(
       GetTimelineByEmployeeParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.support.getDateTimelinesByEmployee(params.idClient),
        data: params,
      );
      final List<DateTimelineModel> dateTimelines =
      response['message'].map((e) => DateTimelineModel.fromJson(e)).toList();

      api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper(message: dateTimelines, data: dateTimelines);
    }

    return throwAppException(fun);
  }
}


