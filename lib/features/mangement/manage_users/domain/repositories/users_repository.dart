import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/usermodel.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../use_cases/get_branches_for_user_usecase.dart';
import '../use_cases/get_levels_for_user_usecase.dart';
import '../use_cases/get_manages_for_user_usecase.dart';
import '../use_cases/get_users_usecase.dart';

abstract class UsersRepository {
  Future<Result<ResponseWrapper<List<UserModel>>>> getUsers(
    GetUsersParams params,
  );

  Future<Result<ResponseWrapper<UserModel>>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });

  Future<Result<ResponseWrapper<UserModel>>> updateUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });

  Future<Either<String, List<ManageModel>>> getManagesForUser(
      GetManagesForUserParams params);

  Future<Either<String, List<LevelModel>>> getLevelsForUser(
      GetLevelsForUserParams params);

  Future<Either<String, List<BranchModel>>> getBranchesForUser(
      GetBranchesForUserParams params);
}
