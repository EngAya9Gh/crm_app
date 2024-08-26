import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/privileges_repo.dart';

@injectable
class UpdatePrivilegesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, UpdatePrivilegesParams> {
  UpdatePrivilegesUsecase(this._repository);

  final PrivilegesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    UpdatePrivilegesParams params,
  ) {
    return _repository.updatePrivileges(params);
  }
}

class UpdatePrivilegesParams {
  final List<String> privilegeUserIdList;
  final List<String> isCheckList;

  UpdatePrivilegesParams({
    required this.isCheckList,
    required this.privilegeUserIdList,
  });

  Map<String, dynamic> toMap() {
    Map privilegeUserIdMap = {};
    privilegeUserIdList.forEachIndexed(
        (i, e) => privilegeUserIdMap.addAll({'id_privg_user[$i]': e}));
    Map isCheckMap = {};
    isCheckList.forEachIndexed(
        (i, e) => privilegeUserIdMap.addAll({'is_check[$i]': e}));

    return {
      ...privilegeUserIdMap,
      ...isCheckMap,
    };
  }
}
