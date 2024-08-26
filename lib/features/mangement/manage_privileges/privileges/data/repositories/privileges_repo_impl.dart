import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../domain/repositories/privileges_repo.dart';
import '../../domain/use_cases/get_privileges_usecase.dart';
import '../../domain/use_cases/update_privileges_usecase.dart';
import '../data_sources/privileges_datasource.dart';
import '../models/privilege_model.dart';

@LazySingleton(as: PrivilegesRepo)
class PrivilegesRepoImpl implements PrivilegesRepo {
  final PrivilegesDatasource _dataSource;

  PrivilegesRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getPrivileges(
    GetPrivilegesParams params,
  ) async {
    try {
      final data = await _dataSource.getPrivileges(params);
      return Right(data.copyWith(
        data: data.data
            .map<PrivilegeModel>((e) => PrivilegeModel.fromJson(e))
            .toList(),
      ));
    } catch (e) {
      debugPrint("error in getPrivileges in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> updatePrivileges(
    UpdatePrivilegesParams params,
  ) async {
    try {
      final data = await _dataSource.updatePrivileges(params);
      return Right(data);
    } catch (e) {
      debugPrint("error in updatePrivileges in repo => $e");
      return Left(e.toString());
    }
  }
}
