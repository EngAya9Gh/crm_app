import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/notifications/data/models/notification_types.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/notifications_repo.dart';

@lazySingleton
class GetNotificationsTypesUsecase extends UseCaseNoParam<Result<ResponseWrapper<NotificationTypes>>> {
  GetNotificationsTypesUsecase(this._repository);

  final NotificationsRepo _repository;

  @override
  Future<Result<ResponseWrapper<NotificationTypes>>> call() async {
    return await _repository.getNotificationTypes();
  }
}
