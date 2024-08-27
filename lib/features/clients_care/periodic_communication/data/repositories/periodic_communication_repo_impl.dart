import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/periodic_communication_repo.dart';
import '../../domain/use_cases/get_periodic_communication_use_case.dart';
import '../data_sources/periodic_communication_datasource.dart';

@LazySingleton(as: PeriodicCommunicationRepo)
class PeriodicCommunicationRepoImpl implements PeriodicCommunicationRepo {
  final PeriodicCommunicationDatasource _dataSource;

  const PeriodicCommunicationRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getPeriodicCommunication(
    GetPeriodicCommunicationParams params,
  ) async {
    try {
      final response = await _dataSource.getPeriodicCommunication(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in getPeriodicCommunication in repo $e");
      return Left(e.toString());
    }
  }
}
