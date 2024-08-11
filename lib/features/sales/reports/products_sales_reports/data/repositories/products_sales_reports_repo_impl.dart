import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../domain/repositories/products_sales_reports_repo.dart';
import '../../domain/use_cases/get_products_sales_reports_usecase.dart';
import '../data_sources/products_sales_reports_datasource.dart';

@LazySingleton(as: ProductsSalesReportsRepo)
class ProductsSalesReportsRepoImpl implements ProductsSalesReportsRepo {
  final ProductsSalesReportsDatasource _dataSource;

  const ProductsSalesReportsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getProductsSalesReports(
    GetProductsSalesReportsParams params,
  ) async {
    try {
      final response = await _dataSource.getProductsSalesReports(params);
      return Right(response.copyWith(
        data: List<BarModel>.from(
          response.data.map((e) => BarModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getProductsSalesReports in repo => $e");
      return Left(e.toString());
    }
  }
}
