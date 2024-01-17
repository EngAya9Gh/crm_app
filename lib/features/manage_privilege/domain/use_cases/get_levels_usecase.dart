import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_privilege/data/models/level_model.dart';
import 'package:crm_smart/features/manage_privilege/domain/repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetLevelsUsecase extends UseCaseNoParam<Result<ResponseWrapper<List<LevelModel>>>> {
  GetLevelsUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<LevelModel>>>> call() {
    return _repository.getLevels();
  }
}
