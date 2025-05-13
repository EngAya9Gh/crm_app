import 'package:dio/dio.dart';

import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../models/care_usage_model.dart';

abstract class CareUsageRemoteDataSource {
  Future<List<CareUsageModel>> getCareUsageList({
    String? endFrom,
    String? endTo,
    String? startFrom,
    String? startTo,
    String? lastActivityFrom,
    String? lastActivityTo,
    String? state,
    String? premium,
    String? package,
    int? fkRegoin,
    int? activityTypeFk,
    int? shouldCommunicate,
  });
}

class CareUsageRemoteDataSourceImpl implements CareUsageRemoteDataSource {
  final ApiServices  api;

  CareUsageRemoteDataSourceImpl({required this.api});

  @override
  Future<List<CareUsageModel>> getCareUsageList({
    String? endFrom,
    String? endTo,
    String? startFrom,
    String? startTo,
    String? lastActivityFrom,
    String? lastActivityTo,
    String? state,
    String? premium,
    String? package,
    int? fkRegoin,
    int? activityTypeFk,
    int? shouldCommunicate,
  }) async {
    final Map<String, dynamic> queryParameters = {
      if (endFrom != null) 'end_from': endFrom,
      if (endTo != null) 'end_to': endTo,
      if (startFrom != null) 'start_from': startFrom,
      if (startTo != null) 'start_to': startTo,
      if (lastActivityFrom != null) 'last_activity_from': lastActivityFrom,
      if (lastActivityTo != null) 'last_activity_to': lastActivityTo,
      if (state != null) 'state': state,
      if (premium != null) 'premium': premium,
      if (package != null) 'package': package,
      if (fkRegoin != null) 'fk_regoin': fkRegoin,
      if (activityTypeFk != null) 'activity_type_fk': activityTypeFk,
      // 'should_communicate': shouldCommunicate ?? 0,
    };

    try {

      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.care.getclient_usages,
        queryParameters: queryParameters,
      );
      final List<CareUsageModel> careUsageList = [];
      for (var item in response.data['message']) {
        careUsageList.add(CareUsageModel.fromJson(item));
      }

      return careUsageList;
    } catch (e) {
      throw Exception('فشل في جلب بيانات كفاءة الاستخدام');
    }
  }
}
