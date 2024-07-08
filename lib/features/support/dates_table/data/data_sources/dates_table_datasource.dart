import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';

abstract interface class DatesTableDataSource {
  Future<dynamic> getDateInstallation(GetDateInstallationParams params);

  Future<dynamic> rescheduleDate(RescheduleDateParams params);

  Future<dynamic> changeDateToDone(ChangeDateToDoneParams params);

  Future<dynamic> cancelSchedule(CancelScheduleParams params);

  Future<dynamic> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  );
}

@LazySingleton(as: DatesTableDataSource)
class DatesTableDataSourceImpl implements DatesTableDataSource {
  final ApiServices _apiServices;

  DatesTableDataSourceImpl(this._apiServices);

  @override
  Future<dynamic> getDateInstallation(
    GetDateInstallationParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);

      final response = await _apiServices.get(
        endPoint: "${params.type.url}${params.prepareParams()}",
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getDateInstallation => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future rescheduleDate(RescheduleDateParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint:
            EndPoints.events.rescheduleOrCancelVisitClient(params.scheduleId),
        data: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in rescheduleDate => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future changeDateToDone(ChangeDateToDoneParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await _apiServices.post(
        endPoint:
            EndPoints.events.updateStatusForVisit(params.event.idClientsDate!),
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in changeDateToDone => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future<dynamic> cancelSchedule(CancelScheduleParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint:
            EndPoints.events.rescheduleOrCancelVisitClient(params.scheduleId),
        data: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in cancelSchedule => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.events.returnScheduleVisitToOpen(params.scheduleId),
        data: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in returnScheduleVisitToOpen => ${e.message}");
      throw e.message;
    }
  }
}
