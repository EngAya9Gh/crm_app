import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/clients_install_reports_repo.dart';
import '../../domain/use_cases/get_clients_install_reports_usecase.dart';
import '../data_sources/clients_install_reports_datasource.dart';

@LazySingleton(as: ClientsInstallReportsRepo)
class ClientsInstallReportsRepoImpl implements ClientsInstallReportsRepo {
  final ClientsInstallReportsDatasource _dataSource;

  const ClientsInstallReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsInstallReports(
    GetClientsInstallReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsInstallReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsInstallReports in repo => $e");
      return Left(e.toString());
    }
  }
}
