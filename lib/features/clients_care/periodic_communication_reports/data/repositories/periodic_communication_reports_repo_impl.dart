import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/periodic_communication_reports_repo.dart';
import '../../domain/use_cases/get_periodic_communication_reports_usecase.dart';
import '../data_sources/periodic_communication_reports_datasource.dart';

@LazySingleton(as: PeriodicCommunicationReportsRepo)
class PeriodicCommunicationReportsRepoImpl
    implements PeriodicCommunicationReportsRepo {
  final PeriodicCommunicationReportsDatasource _dataSource;

  const PeriodicCommunicationReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>>
      getPeriodicCommunicationReports(
    GetPeriodicCommunicationReportsParams params,
  ) async {
    try {
      final response =
          await _dataSource.getPeriodicCommunicationReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getPeriodicCommunicationReports in repo => $e");
      return Left(e.toString());
    }
  }
}
