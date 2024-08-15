import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/clients_debts_reports_repo.dart';
import '../../domain/use_cases/get_clients_debts_reports_usecase.dart';
import '../data_sources/clients_debts_reports_datasource.dart';

@LazySingleton(as: ClientsDebtsReportsRepo)
class ClientsDebtsReportsRepoImpl implements ClientsDebtsReportsRepo {
  final ClientsDebtsReportsDatasource _dataSource;

  const ClientsDebtsReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsDebtsReports(
    GetClientsDebtsReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsDebtsReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsDebtsReports in repo => $e");
      return Left(e.toString());
    }
  }
}
