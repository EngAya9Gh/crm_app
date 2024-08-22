import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/notifications_repo.dart';

@lazySingleton
class GetUnreadNotificationsCountUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>,
    GetUnreadNotificationsCountParams> {
  GetUnreadNotificationsCountUsecase(this._repository);

  final NotificationsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetUnreadNotificationsCountParams params,
  ) async {
    return await _repository.getUnreadNotificationsCount(params);
  }
}

class GetUnreadNotificationsCountParams {
  const GetUnreadNotificationsCountParams();
}
