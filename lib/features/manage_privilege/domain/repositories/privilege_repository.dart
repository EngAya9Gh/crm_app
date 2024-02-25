import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';

import '../../../../core/api/result.dart';
import '../../data/models/level_model.dart';
import '../../data/models/privilege_model.dart';

abstract class PrivilegeRepository {
  Future<Result<ResponseWrapper<List<LevelModel>>>> getLevels();

  Future<Result<ResponseWrapper<String>>> addLevel(Map<String, dynamic> body);

  Future<Result<ResponseWrapper<List<PrivilegeModel>>>> getPrivilege(
      Map<String, dynamic> body);

  Future<Result<ResponseWrapper<void>>> updatePrivilege(
      Map<String, dynamic> body);
}
