import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/privilege_repository.dart';
import '../data_sources/privilege_datasource.dart';
import '../models/level_model.dart';
import '../models/privilege_model.dart';

@Injectable(as: PrivilegeRepository)
class PrivilegeRepositoryImpl extends PrivilegeRepository {
  PrivilegeRepositoryImpl(this._datasource);

  final PrivilegeDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<String>>> addLevel(Map<String, dynamic> body) {
    return toApiResult(() => _datasource.addLevel(body));
  }

  @override
  Future<Result<ResponseWrapper<List<LevelModel>>>> getLevels() {
    return toApiResult(() => _datasource.getLevels());
  }

  @override
  Future<Result<ResponseWrapper<List<PrivilegeModel>>>> getPrivilege(
      Map<String, dynamic> body) {
    return toApiResult(() => _datasource.getPrivileges(body));
  }

  @override
  Future<Result<ResponseWrapper<void>>> updatePrivilege(
      Map<String, dynamic> body) {
    return toApiResult(() => _datasource.updatePrivileges(body));
  }
}
