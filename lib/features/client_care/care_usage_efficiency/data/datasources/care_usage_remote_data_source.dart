import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/usecases/get_care_usage_list.dart';

abstract class CareUsageRemoteDataSource {
  Future<PaginationResponseWrapper> getCareUsageList(
    GetCareUsageListParams params,
  );
}

@LazySingleton(as: CareUsageRemoteDataSource)
class CareUsageRemoteDataSourceImpl implements CareUsageRemoteDataSource {
  final ApiServices _api;

  const CareUsageRemoteDataSourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getCareUsageList(
    GetCareUsageListParams params,
  ) async {
    try {
      Map<String, dynamic> queryParameters = {
        if (params.skip != null) 'skip': params.skip,
        if (params.filter != null && params.filter!.isNotEmpty)
          'filter': params.filter,
        if (params.endFrom != null && params.endFrom!.isNotEmpty)
          'end_from': params.endFrom,
        if (params.endTo != null && params.endTo!.isNotEmpty)
          'end_to': params.endTo,
        if (params.startFrom != null && params.startFrom!.isNotEmpty)
          'start_from': params.startFrom,
        if (params.startTo != null && params.startTo!.isNotEmpty)
          'start_to': params.startTo,
        if (params.lastActivityFrom != null)
          'last_activity_from': params.lastActivityFrom,
        if (params.lastActivityTo != null)
          'last_activity_to': params.lastActivityTo,
        if (params.state != null && params.state!.isNotEmpty)
          'state': params.state,
        if (params.premium != null && params.premium!.isNotEmpty)
          'premium': params.premium,
        if (params.package != null && params.package!.isNotEmpty)
          'package': params.package,
        if (params.fkRegoin != null) 'fk_regoin': params.fkRegoin,
        if (params.activityTypeFk != null)
          'activity_type_fk': params.activityTypeFk,
        if (params.shouldCommunicate != null)
          'should_communicate': params.shouldCommunicate,
      };

      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.care.getclient_usages,
        queryParameters: queryParameters,
      );
      final x = PaginationResponseWrapper.fromJson(response);
      return x;
    } catch (e) {
      throw Exception('Failed to get care usage list: $e');
    }
  }
}
