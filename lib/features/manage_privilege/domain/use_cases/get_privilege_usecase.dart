import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_privilege/data/models/privilege_model.dart';
import 'package:crm_smart/features/manage_privilege/domain/repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetPrivilegesUsecase extends UseCase<
    Result<ResponseWrapper<List<PrivilegeModel>>>, GetPrivilegesParams> {
  GetPrivilegesUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<PrivilegeModel>>>> call(
      GetPrivilegesParams params) {
    return _repository.getPrivilege(params.toMap());
  }
}

class GetPrivilegesParams {
  final String levelId;

  GetPrivilegesParams(this.levelId);

  Map<String, dynamic> toMap() => {'fk_level': levelId};
}
