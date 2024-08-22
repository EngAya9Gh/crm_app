import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/level_model.dart';
import '../repositories/privilege_repository.dart';

@injectable
class GetLevelsUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<LevelModel>>>> {
  GetLevelsUsecase(this._repository);

  final PrivilegeRepository _repository;

  @override
  Future<Result<ResponseWrapper<List<LevelModel>>>> call() {
    return _repository.getLevels();
  }
}
