import 'package:crm_smart/features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart';
import 'package:crm_smart/features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../model/notificationModel.dart';
import '../../domain/repositories/notifications_repo.dart';
import '../../domain/use_cases/get_notifications_usecase.dart';
import '../data_sources/notifications_datasource.dart';

@LazySingleton(as: NotificationsRepo)
class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsDatasource _dataSource;

  const NotificationsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getNotifications(
    GetNotificationsParams params,
  ) async {
    try {
      final data = await _dataSource.getNotifications(params);
      return Right(data.copyWith(
        data: List<NotificationModel>.from(
          data.data.map((e) => NotificationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getNotifications in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> markNotificationsAsRead(
    MarkNotificationsAsReadParams params,
  ) async {
    try {
      final data = await _dataSource.markNotificationsAsRead(params);
      return Right(data);
    } catch (e) {
      debugPrint("error in markNotificationsAsRead in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> getUnreadNotificationsCount(
    GetUnreadNotificationsCountParams params,
  ) async {
    try {
      final data = await _dataSource.getUnreadNotificationsCount(params);
      return Right(data);
    } catch (e) {
      debugPrint("error in getUnreadNotificationsCount in repo => $e");
      return Left(e.toString());
    }
  }
}
