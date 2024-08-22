import 'package:crm_smart/features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart';
import 'package:crm_smart/features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_notifications_usecase.dart';

abstract class NotificationsRepo {
  Future<Either<String, PaginationResponseWrapper>> getNotifications(
    GetNotificationsParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> markNotificationsAsRead(
    MarkNotificationsAsReadParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> getUnreadNotificationsCount(
    GetUnreadNotificationsCountParams params,
  );
}
