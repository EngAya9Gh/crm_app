import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/usermodel.dart';
import '../../../manage_privileges/levels/data/models/level_model.dart';
import '../../domain/repositories/users_repository.dart';
import '../../domain/use_cases/get_branches_for_user_usecase.dart';
import '../../domain/use_cases/get_levels_for_user_usecase.dart';
import '../../domain/use_cases/get_manages_for_user_usecase.dart';
import '../../domain/use_cases/get_users_usecase.dart';
import '../data_sources/users_datasource.dart';

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl(this.datasource);

  final UsersDatasource datasource;

  @override
  Future<Result<ResponseWrapper<List<UserModel>>>> getUsers(
    GetUsersParams params,
  ) {
    return toApiResult(() => datasource.getAllUsers(params));
  }

  @override
  Future<Result<ResponseWrapper<UserModel>>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) {
    return toApiResult(() => datasource.addUser(body: body, param: param));
  }

  @override
  Future<Result<ResponseWrapper<UserModel>>> updateUser(
      {required Map<String, dynamic> body,
      required Map<String, dynamic> param}) {
    return toApiResult(() => datasource.editUser(body: body, param: param));
  }

  @override
  Future<Either<String, List<BranchModel>>> getBranchesForUser(
      GetBranchesForUserParams params) async {
    try {
      final data = await datasource.getBranchesForUser(params);
      List<BranchModel> branches =
          List<BranchModel>.from(data.map((e) => BranchModel.fromJson(e)));
      return Right(branches);
    } catch (e) {
      debugPrint("error in getBranchesForUser => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<LevelModel>>> getLevelsForUser(
      GetLevelsForUserParams params) async {
    try {
      final data = await datasource.getLevelsForUser(params);
      List<LevelModel> levels =
          List<LevelModel>.from(data.map((e) => LevelModel.fromMap(e)));
      return Right(levels);
    } catch (e) {
      debugPrint("error in getLevelsForUser => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ManageModel>>> getManagesForUser(
      GetManagesForUserParams params) async {
    try {
      final data = await datasource.getManagesForUser(params);
      List<ManageModel> manages =
          List<ManageModel>.from(data.map((e) => ManageModel.fromMap(e)));
      return Right(manages);
    } catch (e) {
      debugPrint("error in getManagesForUser => $e");
      return Left(e.toString());
    }
  }
}
