import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_products_sales_reports_usecase.dart';

abstract class ProductsSalesReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getProductsSalesReports(
    GetProductsSalesReportsParams params,
  );
}
