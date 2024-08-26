import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/privileges_repo.dart';

@lazySingleton
class GetPrivilegesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetPrivilegesParams> {
  GetPrivilegesUsecase(this._repository);

  final PrivilegesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPrivilegesParams params,
  ) async {
    return await _repository.getPrivileges(params);
  }
}

class GetPrivilegesParams {
  final String levelId;
  final String filter;
  final String? type;

  const GetPrivilegesParams({
    required this.levelId,
    required this.filter,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      if (type != null) 'type': type,
      'filter': filter,
    };
  }
}
