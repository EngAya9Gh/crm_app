import 'package:collection/collection.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class UpdatePrivilegeUsecase
    extends UseCase<Result<ResponseWrapper<void>>, UpdatePrivilegeParams> {
  UpdatePrivilegeUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Result<ResponseWrapper<void>>> call(UpdatePrivilegeParams params) {
    return _repository.updatePrivilege(params.toMap());
  }
}

class UpdatePrivilegeParams {
  final List<int> privilegeUserIdList;
  final List<int> isCheckList;

  UpdatePrivilegeParams({
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
