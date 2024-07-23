import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/lastCommentClientModel.dart';
import '../../domain/repositories/latest_clients_updates_repository.dart';
import '../../domain/use_cases/get_latest_clients_comments_usecase.dart';
import '../data_sources/latest_clients_updates_datasource.dart';

@LazySingleton(as: LatestClientsUpdatesRepository)
class LatestClientsUpdatesRepositoryImpl
    implements LatestClientsUpdatesRepository {
  final LatestClientsUpdatesDatasource _dataSource;

  LatestClientsUpdatesRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getLatestClients(
    GetLatestClientsParams params,
  ) async {
    try {
      final response = await _dataSource.getLatestClients(params);

      return Right(response.copyWith(
        data: List<LastCommentClientModel>.from(
          response.data.map((e) => LastCommentClientModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint('error in getLatestClients $e');
      return Left(e.toString());
    }
  }
}
