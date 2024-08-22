import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/privilege_model.dart';
import '../repositories/privilege_repository.dart';

@injectable
class GetPrivilegesUsecase extends BaseUsecase<
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
