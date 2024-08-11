import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_regions_sales_reports_usecase.dart';

abstract class RegionsSalesReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getRegionsSalesReports(
    GetRegionsSalesReportsParams params,
  );
}
