import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_privilege/domain/repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class AddLevelUsecase extends UseCase<Result<ResponseWrapper<String>>, AddLevelParams> {
  AddLevelUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(AddLevelParams params) {
    return _repository.addLevel(params.toMap());
  }
}

class AddLevelParams {
  final String levelName;

  AddLevelParams(this.levelName);

  Map<String, dynamic> toMap() => {'name_level': levelName};
}
