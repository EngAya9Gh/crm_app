import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/clients_status_reports_repo.dart';
import '../../domain/use_cases/get_clients_status_reports_usecase.dart';
import '../data_sources/clients_status_reports_datasource.dart';

@LazySingleton(as: ClientsStatusReportsRepo)
class ClientsStatusReportsRepoImpl implements ClientsStatusReportsRepo {
  final ClientsStatusReportsDatasource _dataSource;

  const ClientsStatusReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsStatusReports(
    GetClientsStatusReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsStatusReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsStatusReports in repo => $e");
      return Left(e.toString());
    }
  }
}
