import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/delay_install_reports_repo.dart';
import '../../domain/use_cases/get_delay_install_reports_use_case.dart';
import '../data_sources/delay_install_reports_datasource.dart';

@LazySingleton(as: DelayInstallReportsRepo)
class DelayInstallReportsRepoImpl implements DelayInstallReportsRepo {
  final DelayInstallReportsDatasource _dataSource;

  const DelayInstallReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getDelayInstallReports(
    GetDelayInstallReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getDelayInstallReports(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getDelayInstallReports => $e");
      return Left(e.toString());
    }
  }
}
