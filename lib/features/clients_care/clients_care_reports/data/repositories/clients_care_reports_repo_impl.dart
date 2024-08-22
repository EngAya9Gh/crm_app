import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/clients_care_reports_repo.dart';
import '../../domain/use_cases/get_clients_care_reports_usecase.dart';
import '../data_sources/clients_care_reports_datasource.dart';

@LazySingleton(as: ClientsCareReportsRepo)
class ClientsCareReportsRepoImpl implements ClientsCareReportsRepo {
  final ClientsCareReportsDatasource _dataSource;

  const ClientsCareReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsCareReports(
    GetClientsCareReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsCareReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsCareReports in repo => $e");
      return Left(e.toString());
    }
  }
}
