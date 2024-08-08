import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/employees_sales_reports_repo.dart';
import '../../domain/use_cases/get_employees_sales_reports_usecase.dart';
import '../data_sources/employees_sales_reports_datasource.dart';

@LazySingleton(as: EmployeesSalesReportsRepo)
class EmployeesSalesReportsRepoImpl implements EmployeesSalesReportsRepo {
  final EmployeesSalesReportsDatasource _dataSource;

  const EmployeesSalesReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getEmployeesSalesReports(
    GetEmployeesSalesReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getEmployeesSalesReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getEmployeesSalesReports in repo => $e");
      return Left(e.toString());
    }
  }
}
