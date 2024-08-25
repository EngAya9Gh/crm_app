import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/privilege_repository.dart';
import '../../domain/use_cases/get_privilege_usecase.dart';
import '../data_sources/privilege_datasource.dart';
import '../models/level_model.dart';
import '../models/privilege_model.dart';

@Injectable(as: PrivilegeRepository)
class PrivilegeRepositoryImpl extends PrivilegeRepository {
  PrivilegeRepositoryImpl(this._datasource);

  final PrivilegesDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<String>>> addLevel(Map<String, dynamic> body) {
    return toApiResult(() => _datasource.addLevel(body));
  }

  @override
  Future<Result<ResponseWrapper<List<LevelModel>>>> getLevels() {
    return toApiResult(() => _datasource.getLevels());
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> getPrivilege(
    GetPrivilegesParams params,
  ) async {
    try {
      final data = await _datasource.getPrivileges(params);
      return Right(data.copyWith(
        data: data.data
            ?.map<PrivilegeModel>((e) => PrivilegeModel.fromJson(e))
            .toList(),
      ));
    } catch (e) {
      debugPrint("error in getPrivilege in repository => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Result<ResponseWrapper<void>>> updatePrivilege(
      Map<String, dynamic> body) {
    return toApiResult(() => _datasource.updatePrivileges(body));
  }
}
