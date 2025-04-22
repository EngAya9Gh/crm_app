import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/use_cases/get_elevation_sys_support_use_case.dart';
import '../models/elevation_model.dart';

abstract class ElevationAcrossSystemDatasource {
  Future<ResponseWrapper<List<ElevationModel>>> getRating(GetRatingParams params);
  Future<ResponseWrapper<List<TicketModel>>> systemRatingTickets(GetOrAddSystemRatingTicktesParams params);
  Future<ResponseWrapper<TicketModel>> addSystemRatingTicket(GetOrAddSystemRatingTicktesParams params);
}

@LazySingleton(as: ElevationAcrossSystemDatasource)
class ElevationAcrossSystemDatasourceImpl implements ElevationAcrossSystemDatasource {
  final ApiServices _api;

  const ElevationAcrossSystemDatasourceImpl(this._api);

  @override
  Future<ResponseWrapper<List<ElevationModel>>> getRating(GetRatingParams params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.care.systemRatings, queryParameters: params.toMap());

      return ResponseWrapper<List<ElevationModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => ElevationModel.fromJson(e as Map<String, dynamic>))));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<List<TicketModel>>> systemRatingTickets(GetOrAddSystemRatingTicktesParams params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.care.systemRatingTickets(params.ratingId!));

      return ResponseWrapper<List<TicketModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => TicketModel.fromMap(e as Map<String, dynamic>))));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<TicketModel>> addSystemRatingTicket(GetOrAddSystemRatingTicktesParams params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.care.systemRatingsAddTicket(params.ratingId), data: params.toMapAdd());

      return ResponseWrapper<TicketModel>.fromJson(response, (json) => TicketModel.fromMap(json));
    }

    return throwAppException(fun);
  }
}
