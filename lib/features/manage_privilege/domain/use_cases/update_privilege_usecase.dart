import 'package:collection/collection.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_privilege/domain/repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';

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
  final String userId;

  UpdatePrivilegeParams(
    this.userId, {
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
      'fk_user': userId,
    };
  }
}
