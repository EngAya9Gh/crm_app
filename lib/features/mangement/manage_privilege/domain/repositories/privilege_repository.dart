import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/level_model.dart';
import '../use_cases/get_privilege_usecase.dart';

abstract class PrivilegeRepository {
  Future<Result<ResponseWrapper<List<LevelModel>>>> getLevels();

  Future<Result<ResponseWrapper<String>>> addLevel(Map<String, dynamic> body);

  Future<Either<String, PaginationResponseWrapper>> getPrivilege(
    GetPrivilegesParams params,
  );

  Future<Result<ResponseWrapper<void>>> updatePrivilege(
      Map<String, dynamic> body);
}
