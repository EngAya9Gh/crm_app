import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/notifications_repo.dart';

@lazySingleton
class MarkNotificationsAsReadUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, MarkNotificationsAsReadParams> {
  MarkNotificationsAsReadUsecase(this._repository);

  final NotificationsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    MarkNotificationsAsReadParams params,
  ) async {
    return await _repository.markNotificationsAsRead(params);
  }
}

class MarkNotificationsAsReadParams {
  const MarkNotificationsAsReadParams();
}
