import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../repositories/privilege_repository.dart';

@injectable
class AddLevelUsecase
    extends BaseUsecase<Result<ResponseWrapper<String>>, AddLevelParams> {
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
