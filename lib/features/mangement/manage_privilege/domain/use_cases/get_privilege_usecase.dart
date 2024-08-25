import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/privilege_repository.dart';

@injectable
class GetPrivilegesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetPrivilegesParams> {
  GetPrivilegesUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPrivilegesParams params,
  ) {
    return _repository.getPrivilege(params);
  }
}

class GetPrivilegesParams {
  final String levelId;

  GetPrivilegesParams({required this.levelId});

  Map<String, dynamic> toMap() => {'fk_level': levelId};
}
