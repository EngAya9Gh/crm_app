import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/regions_sales_reports_repo.dart';
import '../../domain/use_cases/get_regions_sales_reports_usecase.dart';
import '../data_sources/regions_sales_reports_datasource.dart';

@LazySingleton(as: RegionsSalesReportsRepo)
class RegionsSalesReportsRepoImpl implements RegionsSalesReportsRepo {
  final RegionsSalesReportsDatasource _dataSource;

  const RegionsSalesReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getRegionsSalesReports(
    GetRegionsSalesReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getRegionsSalesReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getRegionsSalesReports in repo => $e");
      return Left(e.toString());
    }
  }
}
