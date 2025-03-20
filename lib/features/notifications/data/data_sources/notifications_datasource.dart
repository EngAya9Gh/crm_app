import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/notifications/data/models/notification_types.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_notifications_usecase.dart';
import '../../domain/use_cases/get_unread_notifications_count_usecase.dart';
import '../../domain/use_cases/mark_notifications_as_read_usecase.dart';

abstract class NotificationsDatasource {
  Future<PaginationResponseWrapper> getNotifications(
    GetNotificationsParams params,
  );

  Future<PaginationResponseWrapper> markNotificationsAsRead(
    MarkNotificationsAsReadParams params,
  );

  Future<PaginationResponseWrapper> getUnreadNotificationsCount(
    GetUnreadNotificationsCountParams params,
  );
  Future<ResponseWrapper<NotificationTypes>> getNotificationTypes();
}

@LazySingleton(as: NotificationsDatasource)
class NotificationsDatasourceImpl implements NotificationsDatasource {
  final ApiServices _api;

  const NotificationsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getNotifications(
    GetNotificationsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.notifications.getNotifications,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getNotifications in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<PaginationResponseWrapper> markNotificationsAsRead(
    MarkNotificationsAsReadParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.notifications.markNotificationsAsRead,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in markNotificationsAsRead in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<PaginationResponseWrapper> getUnreadNotificationsCount(
    GetUnreadNotificationsCountParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.notifications.getUnreadNotificationsCount,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getUnreadNotificationsCount in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<ResponseWrapper<NotificationTypes>> getNotificationTypes() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.notifications.notificationsTypes,
      );

      return ResponseWrapper<NotificationTypes>.fromJson(response,(json) => NotificationTypes.fromJson(json));
    } on BaseAppException catch (e) {
      debugPrint("error in getUnreadNotificationsCount in datasource => $e");
      throw e.message;
    }
  }
}
