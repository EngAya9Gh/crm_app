import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/server_exceptions.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/usecases/get_care_usage_list.dart';

import '../models/care_usage_model.dart';

abstract class CareUsageRemoteDataSource {
  Future<PaginationResponseWrapper> getCareUsageList(
    GetCareUsageListParams params,
  );

  Future<CareUsageModel> doneCommunication(int communicationId);
}

@LazySingleton(as: CareUsageRemoteDataSource)
class CareUsageRemoteDataSourceImpl implements CareUsageRemoteDataSource {
  final ApiServices _api;
  final Dio _dio;

  const CareUsageRemoteDataSourceImpl(this._api, this._dio);

  @override
  Future<PaginationResponseWrapper> getCareUsageList(
    GetCareUsageListParams params,
  ) async {
    try {
      int   skip=0;
      if (params.skip != null)
      skip= params.skip!;
      int?  limit=AppConstants.kPerPage;
      Map<String, dynamic> queryParameters = {
        'limit':  AppConstants.kPerPage,
        'page': ApiHelper.calculatePage(skip:  skip, limit: limit),
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
        if (params.fkRegoin != null) 'fk_regoin': params.fkRegoin,
        if (params.activityTypeFk != null)
          'activity_type_fk': params.activityTypeFk,
        if (params.shouldCommunicate != null)
          'should_communicate': params.shouldCommunicate,
      };
      if (params.package.isNotEmpty)
        queryParameters.addAll(ApiHelper.prepareParamsList(
          key: 'package',
          values: params.package.map((e) => e).toList(),
        ));

      if (params.possibilityOfWithdraw.isNotEmpty)
        queryParameters.addAll(ApiHelper.prepareParamsList(
          key: 'possibility_of_withdraw',
          values: params.possibilityOfWithdraw.map((e) => e).toList(),
        ));

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

  @override
  Future<CareUsageModel> doneCommunication(int communicationId) async {
    try {
      final response = await _dio.post(
        'communications/$communicationId/done-communication',
      );

      if (response.statusCode == 200) {
        return CareUsageModel.fromJson(response.data['message']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'حدث خطأ ما',
          exception: null,
        );
      }
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        exception: null,
      );
    }
  }
}
