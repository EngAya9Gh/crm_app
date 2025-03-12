import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/enums/notifications/notification_type_enum.dart';
import '../../../../core/utils/app_constants.dart';
import '../repositories/notifications_repo.dart';

@lazySingleton
class GetNotificationsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetNotificationsParams> {
  GetNotificationsUsecase(this._repository);

  final NotificationsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetNotificationsParams params,
  ) async {
    return await _repository.getNotifications(params);
  }
}

class GetNotificationsParams {
  final int skip;
  final int limit;
  final String query;
  final String? notificationType;
  final String? dateFrom;
  final String? dateTo;

  const GetNotificationsParams({
    this.skip = 1,
    this.limit = AppConstants.kPerPage,
    required this.query,
    this.notificationType,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    final Map<String, dynamic> map = {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'type_notify': notificationType,
      'from': dateFrom,
      'to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');

    return {
      'filter': query,
      ...map,
    };
  }
}
