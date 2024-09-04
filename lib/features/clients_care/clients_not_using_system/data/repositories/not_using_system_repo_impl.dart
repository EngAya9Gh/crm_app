import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/not_using_system_repo.dart';
import '../../domain/use_cases/get_not_using_system_usecase.dart';
import '../data_sources/not_using_system_datasource.dart';

@LazySingleton(as: NotUsingSystemRepo)
class NotUsingSystemRepoImpl implements NotUsingSystemRepo {
  final NotUsingSystemDatasource _dataSource;

  const NotUsingSystemRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getNotUsingSystem(
    GetNotUsingSystemParams params,
  ) async {
    try {
      final response = await _dataSource.getNotUsingSystem(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getNotUsingSystem in repo $e");
      return Left(e.toString());
    }
  }
}
