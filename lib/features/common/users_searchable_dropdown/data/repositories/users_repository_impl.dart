import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/usermodel.dart';
import '../../domain/repositories/users_repository.dart';
import '../../domain/use_cases/get_users_usecase.dart';
import '../data_sources/users_datasource.dart';

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  final UsersDatasource _datasource;

  const UsersRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<UserEntity>>> getUsers(
    GetUsersParams params,
  ) async {
    try {
      final data = await _datasource.getUsers(params);
      final List<UserModel> users = List<UserModel>.from(
        data.map((e) => UserModel.fromJson(e)),
      );

      return Right(users);
    } catch (e) {
      debugPrint('error in getUsers in repo => $e');
      return Left(e.toString());
    }
  }
}
