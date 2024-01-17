import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/manage_privilege/data/data_sources/privilege_datasource.dart';
import 'package:crm_smart/features/manage_privilege/data/models/level_model.dart';
import 'package:crm_smart/features/manage_privilege/data/models/privilege_model.dart';
import 'package:crm_smart/features/manage_privilege/domain/repositories/privilege_repository.dart';
import 'package:injectable/injectable.dart';

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
  Future<Result<ResponseWrapper<List<PrivilegeModel>>>> getPrivilege(Map<String, dynamic> body) {
    return toApiResult(() => _datasource.getPrivileges(body));
  }

  @override
  Future<Result<ResponseWrapper<void>>> updatePrivilege(Map<String, dynamic> body) {
    return toApiResult(() => _datasource.updatePrivileges(body));
  }
}
